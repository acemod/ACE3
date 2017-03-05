#define COMPONENT sandbag
#define COMPONENT_BEAUTIFIED Sand Bag
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SANDBAG
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SANDBAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SANDBAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

//@todo add Tanoa surfaces
#define SURFACE_BLACKLIST [ \
    "water", \
    "tarmac", \
    "concrete", "concrete_int", "int_concrete", \
    "wood", "wood_int", "int_wood", \
    "metal", "metal_int", "wavymetal", "int_metal", \
    "roof_tin", "roof_tiles", \
    "tiling", "tiles_int", "int_tiles", \
    "stony", "rock" \
]
