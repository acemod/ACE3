#pragma once

#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class HEAT : public base_penetration_model {
            public:
                using base_penetration_model::base_penetration_model;

                bool process() override;
            };
        }
    }
};