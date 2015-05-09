#pragma once

#include "penetration.hpp"

namespace ace {
    namespace vehicledamage {
        namespace penetration {
            class longrod : public base_penetration_model {
            public:
                using base_penetration_model::base_penetration_model;

                bool process() override;
            protected:
                float _working_length();

            private:
                const static float material_coefficients[][5];
            };
        }
    }
};