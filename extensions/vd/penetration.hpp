#pragma once

#include <atomic>

#include "shared.hpp"
#include "vector.hpp"
#include "game.hpp"
#include "vehicle.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class penetration_result {
            public:
                bool            placeholder_1;
                float            linear_depth;
            };

            class base_penetration_model {
            public:
                base_penetration_model(const gamehit * hit_, vehicle *vehicle_) : _hit(hit_), _vehicle(vehicle_) {
                    process();
                }
                virtual bool                        process() { return false; }
                virtual const penetration_result  & result() { return _result; }
                
                virtual bool                complete() { return _complete;  }
            protected:
                const gamehit             *_hit;
                vehicle                   *_vehicle;
                penetration_result        _result;

                std::atomic_bool          _complete;
            };
        }
    }
}