#define COMPONENT common
#define COMPONENT_BEAUTIFIED Common
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMON
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// just kept for BWC, canDig now uses GVAR(canDigSurfaces)
#define DIG_SURFACE_BLACKLIST [ \
    "concrete", "concrete_exp", "concrete_int", "int_concrete", "int_concrete_exp", \
    "pavement_exp", "int_pavement_exp", \
    "tiling", "tiles_int", "int_tiles", \
    "roof_tin", "roof_tiles", "rooftiles_exp", \
    "tarmac", "asphalt_exp", \
    "stones_exp", "rock", "stony", \
    "metal", "gridmetal_exp", "metalplate_exp", "int_metalplate_exp", "metal_int", "wavymetal", "wavymetal_exp", "int_metal", "steel_exp", \
    "lino_exp", "int_lino_exp", "int_mat_exp", \
    "wood", "wood_int", "int_wood", "softwood_exp", "int_softwood_exp", "int_solidwood_exp" \
]

#define DIG_SURFACE_WHITELIST ["grass", "grasstall_exp", "forest_exp", "snow"]
