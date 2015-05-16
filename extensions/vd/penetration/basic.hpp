#pragma once

#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class basic : public base_penetration_model {
            public:
                bool process() override;
            };
        }
    }
}