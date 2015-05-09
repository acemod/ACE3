#if defined(DEVEL) && defined(USE_DIRECTX)

#pragma once

#include "shared.hpp"

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

#include "dispatch.hpp"
#include "simulation/object.hpp"
#include "vehicle.hpp"

#include "game.hpp"

using namespace ace::debug;
using namespace DirectX;

namespace ace {
    namespace vehicledamage {
        namespace debug {
            __declspec(align(16))
            class penetration_display : public d3d_display, public dispatcher {
            public:
                penetration_display();

                // Debug dispatch messages
                bool register_vehicle(const arguments &, std::string &);
                bool show_hit(const arguments &, std::string &);

                // End

                bool init() override;
                bool step(void) override;

                std::unique_ptr<CommonStates>                           _States;
                std::unique_ptr<GeometricPrimitive>                     _Shape;
                std::unique_ptr<PrimitiveBatch<VertexPositionColor>>    _Batch;
                std::unique_ptr<SpriteFont>                             _Font;
                std::unique_ptr<BasicEffect>                            _BatchEffect;
                std::unique_ptr<EffectFactory>                          _FXFactory;

                // ACE stuff
                std::unique_ptr<ace::simulation::object>                _object;

                vehicle_p                                               _active_vehicle;
                std::vector<gamehit_p>                                  _active_hits;
                
                void DrawHits(uint32_t lod, PrimitiveBatch<VertexPositionColor>& batch, GXMVECTOR color);
                void DrawCollisions(const std::vector<ace::vector3<float>> & collisions, PrimitiveBatch<VertexPositionColor>& batch, GXMVECTOR color);
                void DrawObject(uint32_t lod, PrimitiveBatch<VertexPositionColor>& batch, ace::simulation::object & obj, GXMVECTOR color);
                void DrawGrid(PrimitiveBatch<VertexPositionColor>& batch, FXMVECTOR xAxis, FXMVECTOR yAxis, FXMVECTOR origin, size_t xdivs, size_t ydivs, GXMVECTOR color);
            };
        }
    }
}


#endif