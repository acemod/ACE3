#define COMPONENT radar
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_RADAR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RADAR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RADAR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define RAD_TO_DEG(var) (var * 180 / pi)
