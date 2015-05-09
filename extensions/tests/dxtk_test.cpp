#include <Windows.h>
#include <algorithm>

#include "directx/d3d_display.hpp"

#include "CommonStates.h"
#include "DDSTextureLoader.h"
#include "Effects.h"
#include "GeometricPrimitive.h"
#include "Model.h"
#include "PrimitiveBatch.h"
#include "ScreenGrab.h"
#include "SpriteBatch.h"
#include "SpriteFont.h"
#include "VertexTypes.h"

#include "simulation/object.hpp"
#include "p3d/parser.hpp"

using namespace ace::debug;
using namespace DirectX;

#include "logging.hpp"
INITIALIZE_EASYLOGGINGPP

#include <DirectXMath.h>

class d3d_test : public d3d_display {   
public:
    bool init() override {
        HRESULT hr = S_OK;
        d3d_display::init();
        // Create DirectXTK objects
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

        XMStoreFloat4x4(&_World, XMMatrixIdentity());

        // Initialize the view matrix
        XMVECTOR Eye = XMVectorSet(1.0f, 6.0f, -6.0f, 0.0f);
        XMVECTOR At = XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f);
        XMVECTOR Up = XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f);
        XMStoreFloat4x4(&_View, XMMatrixLookAtLH(Eye, At, Up));

        _BatchEffect->SetView(XMLoadFloat4x4(&_View));

        // Initialize the projection matrix
        RECT rc;
        GetClientRect(_hWnd, &rc);
        UINT width = rc.right - rc.left;
        UINT height = rc.bottom - rc.top;
        XMStoreFloat4x4(&_Projection, XMMatrixPerspectiveFovLH(XM_PIDIV4, width / (FLOAT)height, 0.01f, 100.0f));

        _BatchEffect->SetProjection(XMLoadFloat4x4(&_Projection));
    }

    bool step(void) override {

        const XMVECTORF32 xaxis = { 20.f, 0.f, 0.f };
        const XMVECTORF32 yaxis = { 0.f, 0.f, 20.f };
        DrawGrid(*_Batch, xaxis, yaxis, g_XMZero, 20, 20, Colors::Gray);

        DrawObject(0, *_Batch, *_object, Colors::White);

        return true;
    }

    std::unique_ptr<CommonStates>                           _States;
    std::unique_ptr<GeometricPrimitive>                     _Shape;
    std::unique_ptr<PrimitiveBatch<VertexPositionColor>>    _Batch;
    std::unique_ptr<SpriteFont>                             _Font;
    std::unique_ptr<BasicEffect>                            _BatchEffect;
    std::unique_ptr<EffectFactory>                          _FXFactory;

    // ACE stuff
    std::unique_ptr<ace::simulation::object>                _object;

    void DrawObject(uint32_t lod, PrimitiveBatch<VertexPositionColor>& batch, ace::simulation::object & obj, GXMVECTOR color) {
        
        batch.Begin();

        for (auto & face : obj.lods[lod]->faces) {
            /*XMVECTORF32 v[3] = {
                        { face->vertices[0]->x(), face->vertices[0]->z(), face->vertices[0]->y() },
                        { face->vertices[1]->x(), face->vertices[1]->z(), face->vertices[1]->y() },
                        { face->vertices[2]->x(), face->vertices[2]->z(), face->vertices[2]->y() }
            };*/
            XMVECTORF32 v[3] = {
                { face->vertices[0]->x(), face->vertices[0]->y(), face->vertices[0]->z() },
                { face->vertices[1]->x(), face->vertices[1]->y(), face->vertices[1]->z() },
                { face->vertices[2]->x(), face->vertices[2]->y(), face->vertices[2]->z() }
            };

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

    void DrawGrid(PrimitiveBatch<VertexPositionColor>& batch, FXMVECTOR xAxis, FXMVECTOR yAxis, FXMVECTOR origin, size_t xdivs, size_t ydivs, GXMVECTOR color) {
        _BatchEffect->Apply(_pImmediateContext);

        _pImmediateContext->IASetInputLayout(_pBatchInputLayout);

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
};

int main(int argc, char **argv) {
    el::Configurations log_conf;
    log_conf.setGlobally(el::ConfigurationType::Filename, "logs/dxtk_test.log");

#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    //%d%M%Y-%H:%m:%s.%g            
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif

    if (argc < 2) {
        printf("Usage: %s [file.p3d]", argv[0]);
        return -1;
    }
    ace::p3d::parser _parser;

    d3d_test test;
    test.create(1024, 768, false);
    test.init();

    ace::p3d::model_p _model = _parser.load(argv[1]);

    test._object = std::make_unique<ace::simulation::object>(_model);

    test.run();

    return -1;
}