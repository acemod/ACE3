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

#define W_gps 0.4025
#define H_gps 0.25
#define X_gps_default safeZoneX + safeZoneW - 1.1 * W_gps
#define Y_gps_default safeZoneY + safeZoneH - 1.65 * H_gps
