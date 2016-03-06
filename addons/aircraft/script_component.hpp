#define COMPONENT aircraft
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_AIRCRAFT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_AIRCRAFT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AIRCRAFT
#endif

#include "\z\ace\addons\main\script_macros.hpp"