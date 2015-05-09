#pragma once

#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class missile : public base_penetration_model {
            public:
                bool process() override;
            };
        }
    }
}