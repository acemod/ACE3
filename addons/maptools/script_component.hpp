#define COMPONENT maptools
#define COMPONENT_BEAUTIFIED Map Tools
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MAPTOOLS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAPTOOLS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAPTOOLS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define TEXTURE_WIDTH_IN_M    6205
#define CENTER_OFFSET_Y_PERC  0.1606
#define CONSTANT_SCALE        0.2
#define DIST_BOTTOM_TO_CENTER_PERC  -0.33
#define DIST_TOP_TO_CENTER_PERC      0.65
#define DIST_LEFT_TO_CENTER_PERC     0.30
