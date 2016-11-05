#define COMPONENT viewdistance
#define COMPONENT_BEAUTIFIED View Distance
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_VIEWDISTANCE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VIEWDISTANCE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_VIEWDISTANCE
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define VD_ZOOM_NORMAL 1.00041
#define VD_ZOOM_DIVISION 35
#define VD_ZOOM_DIVISION_AIR 10
