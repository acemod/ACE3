#if defined(DEVEL) && defined(USE_DIRECTX)

#include "penetration_display.hpp"
#include "controller.hpp"
#include "game.hpp"

namespace ace {
    namespace vehicledamage {
        namespace debug {
            penetration_display::penetration_display() :
                dispatcher() {
                _active_vehicle = nullptr;

                add("register_vehicle", std::bind(&ace::vehicledamage::debug::penetration_display::register_vehicle, this, std::placeholders::_1, std::placeholders::_2));
                add("show_hit", std::bind(&ace::vehicledamage::debug::penetration_display::show_hit, this, std::placeholders::_1, std::placeholders::_2));
            }

            bool penetration_display::show_hit(const arguments &args, std::string &result) {
                std::lock_guard<std::mutex> _lock(_render_lock);

                _active_hits.push_back(gamehit::create(args));

                auto _vehicle = controller::get().vehicles.find(args[0]);
                if (_vehicle == controller::get().vehicles.end())
                    return false;

                btVector3 vectorFrom(5, 20, 0);
                btVector3 vectorTo = _vehicle->second->bt_object->getWorldTransform().getOrigin();
                btVector3 direction = vectorFrom - vectorTo;

                XMVECTORF32 eyePos = { vectorFrom.x(), vectorFrom.y(), vectorFrom.z() };
                XMVECTORF32 eyeDir = { direction.x(), direction.y(), direction.z() };
                XMVECTORF32 up = { 0.f, 1.f, 0.f };

                XMStoreFloat4x4(&_View, XMMatrixLookAtLH(eyePos, eyeDir, up));

                return true;
            }
            bool penetration_display::register_vehicle(const arguments &args, std::string &result) {
                std::lock_guard<std::mutex> _lock(_render_lock);

                uint32_t id = args[0];
                
                _active_vehicle = ace::vehicledamage::controller::get().vehicles[id];

                return true;
            }

            bool penetration_display::init() {
                HRESULT hr = S_OK;
                d3d_display::init();

                std::lock_guard<std::mutex> _lock(_render_lock);
                _States.reset(new CommonStates(_pd3dDevice));
                _FXFactory.reset(new EffectFactory(_pd3dDevice));
                _Batch.reset(new PrimitiveBatch<VertexPositionColor>(_pImmediateContext));
                //_Font.reset(new SpriteFont(_pd3dDevice, L"italic.spritefont"));
  
                _BatchEffect.reset(new BasicEffect(_pd3dDevice));
                _BatchEffect->SetVertexColorEnabled(true);
                
                {
                    void const* shaderByteCode;
                    size_t byteCodeLength;

                    _BatchEffect->GetVertexShaderBytecode(&shaderByteCode, &byteCodeLength);
                    
                    hr = _pd3dDevice->CreateInputLayout(VertexPositionColor::InputElements,
                        VertexPositionColor::InputElementCount,
                        shaderByteCode, byteCodeLength,
                        &_pBatchInputLayout);
                    if (FAILED(hr))
                        return hr;
                }

                _BatchEffect->SetView(XMLoadFloat4x4(&_View));
                _BatchEffect->SetProjection(XMLoadFloat4x4(&_Projection));

                CommonStates states(_pd3dDevice);
                _pImmediateContext->OMSetBlendState(states.Opaque(), nullptr, 0xFFFFFFFF);
                _pImmediateContext->OMSetDepthStencilState(states.DepthNone(), 0);
                _pImmediateContext->RSSetState(states.CullCounterClockwise());

                _BatchEffect->Apply(_pImmediateContext);
                _pImmediateContext->IASetInputLayout(_pBatchInputLayout);
            }

            bool penetration_display::step(void) {

                _BatchEffect->Apply(_pImmediateContext);

                _pImmediateContext->IASetInputLayout(_pBatchInputLayout);

                const XMVECTORF32 xaxis = { 20.f, 0.f, 0.f };
                const XMVECTORF32 yaxis = { 0.f, 0.f, 20.f };
                DrawGrid(*_Batch, xaxis, yaxis, g_XMZero, 20, 20, Colors::Gray);

                // Draw the red line for nou
                _Batch->Begin();
                const XMVECTORF32 v1 = { 0.f, 100.f, 0.f };
                const XMVECTORF32 v2 = { 0.f, -100.f, 0.f };
                _Batch->DrawLine(VertexPositionColor(v1, Colors::Red), VertexPositionColor(v2, Colors::Red));

                const XMVECTORF32 v3 = { 100.f, 0.f, 0.f };
                const XMVECTORF32 v4 = { -100.f, 0.f, 0.f };
                _Batch->DrawLine(VertexPositionColor(v3, Colors::Green), VertexPositionColor(v4, Colors::Green));

                const XMVECTORF32 v5 = { 0.f, 0.f, 100.f };
                const XMVECTORF32 v6 = { 0.f, -0.f, -100.f };
                _Batch->DrawLine(VertexPositionColor(v5, Colors::Blue), VertexPositionColor(v6, Colors::Blue));

                _Batch->End();


                // Draw the bullet world
                // The BT debug drawing is a single batch
                _Batch->Begin();
                ace::vehicledamage::controller::get().bt_world->debugDrawWorld();
                _Batch->End();

                
                if (_active_vehicle) {
                    DrawObject(_active_vehicle->fire_lod, *_Batch, *_active_vehicle->object, Colors::Gray);
                }
                if (_active_hits.size() > 0) {
                    DrawHits(0, *_Batch, Colors::Yellow);

                    for (auto & hit : _active_hits) {
                        std::vector<ace::vector3<float>> collisions;
                        //_active_vehicle->surface_raycast(hit->impactposition, hit->impactvelocity, collisions);
                        //DrawCollisions(collisions, *_Batch, Colors::Purple);
                    }
                }

                _BatchEffect->SetView(XMLoadFloat4x4(&_View));
                _BatchEffect->SetProjection(XMLoadFloat4x4(&_Projection));

                return true;
            }
            void penetration_display::DrawCollisions(const std::vector<ace::vector3<float>> & collisions, PrimitiveBatch<VertexPositionColor>& batch, GXMVECTOR color) {
                batch.Begin();
                float scale = 0.01f;

                for (auto & collision : collisions) {
                    XMFLOAT3 A = { collision.x() + scale, collision.y()+scale, collision.z()+scale };
                    XMFLOAT3 B = { collision.x(), collision.y(), collision.z() };
                    XMFLOAT3 C = { collision.x()-scale, collision.y()-scale, collision.z() - scale };
  

                    VertexPositionColor v1(XMLoadFloat3(&A), color);
                    VertexPositionColor v2(XMLoadFloat3(&B), color);
                    VertexPositionColor v3(XMLoadFloat3(&C), color);


                    batch.DrawLine(v1, v2);
                    batch.DrawLine(v2, v3);
                    batch.DrawLine(v3, v1);
                    //batch.DrawTriangle(v1, v2, v3);
                }

                batch.End();
                
            }
            void penetration_display::DrawHits(uint32_t lod, PrimitiveBatch<VertexPositionColor>& batch, GXMVECTOR color) {

                batch.Begin();

                for (gamehit_p & hit : _active_hits) {
                    ace::vector3<float> hit_from, hit_to;

                    hit_from = hit->impactposition;
                    hit_to = hit_from + (hit->impactvelocity * 0.01f);

                    XMVECTORF32 from = { hit_from.x(), hit_from.y(), hit_from.z() };
                    XMVECTORF32 to = { hit_to.x(), hit_to.y(), hit_to.z() };

                    VertexPositionColor v1(from, color);
                    VertexPositionColor v2(to, color);

                    batch.DrawLine(v1, v2);
                }


                batch.End();

            }
            void penetration_display::DrawObject(uint32_t lod, PrimitiveBatch<VertexPositionColor>& batch, ace::simulation::object & obj, GXMVECTOR color) {

                batch.Begin();

                // Debug animation the shit
                _active_vehicle->simulate();

                /*for (auto & selection : obj.lods[lod]->selections) {
                    for (auto & face : selection.second->faces) {
                        ace::vector3<float> vertices[3];
                        vertices[0] = { face->vertices[0]->x(), face->vertices[0]->y(), face->vertices[0]->z() };
                        vertices[1] = { face->vertices[1]->x(), face->vertices[1]->y(), face->vertices[1]->z() };
                        vertices[2] = { face->vertices[2]->x(), face->vertices[2]->y(), face->vertices[2]->z() };

                        XMVECTORF32 v[3] = {
                            { vertices[0].x(), vertices[0].y(), vertices[0].z() },
                            { vertices[1].x(), vertices[1].y(), vertices[1].z() },
                            { vertices[2].x(), vertices[2].y(), vertices[2].z() }
                        };

                        VertexPositionColor v1(v[0], color);
                        VertexPositionColor v2(v[1], color);
                        VertexPositionColor v3(v[2], color);

                        batch.DrawLine(v1, v2);
                        batch.DrawLine(v2, v3);
                        batch.DrawLine(v3, v1);
                    }
                }*/

                
                for (auto & face : obj.lods[lod]->faces) {
                    ace::vector3<float> vertices[3];
                    vertices[0] = { face->vertices[0]->x(), face->vertices[0]->y(), face->vertices[0]->z() };
                    vertices[1] = { face->vertices[1]->x(), face->vertices[1]->y(), face->vertices[1]->z() };
                    vertices[2] = { face->vertices[2]->x(), face->vertices[2]->y(), face->vertices[2]->z() };

                    XMVECTORF32 v[3] = {
                        { vertices[0].x(), vertices[0].y(), vertices[0].z() },
                        { vertices[1].x(), vertices[1].y(), vertices[1].z() },
                        { vertices[2].x(), vertices[2].y(), vertices[2].z() }
                    };
                    //v[0] = v[0] + obj

                    VertexPositionColor v1(v[0], color);
                    VertexPositionColor v2(v[1], color);
                    VertexPositionColor v3(v[2], color);

                    batch.DrawLine(v1, v2);
                    batch.DrawLine(v2, v3);
                    batch.DrawLine(v3, v1);
                    //batch.DrawTriangle(v1, v2, v3);
                }

                batch.End();
            }
            void penetration_display::DrawGrid(PrimitiveBatch<VertexPositionColor>& batch, FXMVECTOR xAxis, FXMVECTOR yAxis, FXMVECTOR origin, size_t xdivs, size_t ydivs, GXMVECTOR color) {
                batch.Begin();

                xdivs = std::max<size_t>(1, xdivs);
                ydivs = std::max<size_t>(1, ydivs);

                for (size_t i = 0; i <= xdivs; ++i) {
                    float fPercent = float(i) / float(xdivs);
                    fPercent = (fPercent * 2.0f) - 1.0f;
                    XMVECTOR vScale = XMVectorScale(xAxis, fPercent);
                    vScale = XMVectorAdd(vScale, origin);

                    VertexPositionColor v1(XMVectorSubtract(vScale, yAxis), color);
                    VertexPositionColor v2(XMVectorAdd(vScale, yAxis), color);
                    batch.DrawLine(v1, v2);
                }

                for (size_t i = 0; i <= ydivs; i++) {
                    FLOAT fPercent = float(i) / float(ydivs);
                    fPercent = (fPercent * 2.0f) - 1.0f;
                    XMVECTOR vScale = XMVectorScale(yAxis, fPercent);
                    vScale = XMVectorAdd(vScale, origin);

                    VertexPositionColor v1(XMVectorSubtract(vScale, xAxis), color);
                    VertexPositionColor v2(XMVectorAdd(vScale, xAxis), color);
                    batch.DrawLine(v1, v2);
                }

                batch.End();
            }

            // Bullet debug functions
            void penetration_display::drawLine(const btVector3& from, const btVector3& to, const btVector3& color) {

                XMVECTORF32 v1 = { from.x(), from.y(), from.z() };
                XMVECTORF32 v2 = { to.x(), to.y(), to.z() };
                _Batch->DrawLine(VertexPositionColor(v1, Colors::LightCoral), VertexPositionColor(v2, Colors::LightCoral));
            }

            void penetration_display::drawContactPoint(const btVector3 &PointOnB, const btVector3 &normalOnB, btScalar distance, int lifeTime, const btVector3 &color) {

            }

            void penetration_display::reportErrorWarning(const char *warningString) {
                LOG(WARNING) << "btWarning - {" << warningString << "}";
            }

            void penetration_display::draw3dText(const btVector3 &location, const char *textString) {

            }

            void penetration_display::setDebugMode(int debugMode) {
                _bt_debug_mode = debugMode;
            }

            int penetration_display::getDebugMode() const {

                return _bt_debug_mode;
            }
        }
    }
}


#endif