#pragma once

namespace ace {
    namespace vehicledamage {
        enum class MATERIAL_TYPES {
            TUNGSTEN = 0,
            DEPLETED_URANIUM = 1,
            STEEL = 2,
            LEAD = 3
        };

        // Hardness, density
        const static float material_properties[][2] = {
            { 600, 19100 },
            { 600, 19100 },
            { 300, 4800 },
            { 300, 11000 }
        };

    }
}