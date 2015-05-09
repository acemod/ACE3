#pragma once

#include <atomic>

#include "shared.hpp"
#include "vector.hpp"
#include "game.hpp"
#include "vehicle.hpp"
#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace damage {
            class damage_result {
            public:
                bool                                  penetrated;

                ace::vector3<ace::vector3<float>>     surface_shape;
                ace::vector3<ace::vector3<float>>     end_shape;
                ace::spatial<float>                   location;

                uint32_t                              type;
            };

            class base_damage_model {
            public:
                base_damage_model(const gamehit &hit_, vehicle_p &vehicle_, penetration::penetration_result penetration_) : _hit(hit_), _vehicle(vehicle_), _penetration(penetration_) {
                    process();
                }
                virtual bool                        process() = 0;
                virtual const damage_result         & result() { return _result; }

                virtual bool                        complete() { return _complete; }
            protected:
                gamehit                                  _hit;
                vehicle_p                                _vehicle;
                penetration::penetration_result          _penetration;
                damage_result                            _result;

                std::atomic_bool                         _complete;
            };
        }
    }
}