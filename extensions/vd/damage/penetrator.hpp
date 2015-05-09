#pragma once

#include "damage.hpp"

namespace ace {
    namespace vehicledamage {
        namespace damage {
            class penetrator : public base_damage_model {
            public:
                bool process() override;
            };
        }
    }
};