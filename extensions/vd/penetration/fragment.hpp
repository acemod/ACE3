#pragma once

#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class fragment : public base_penetration_model {
            public:
                bool process() override;
            };
        }
    }
}