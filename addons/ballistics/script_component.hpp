#define COMPONENT ballistics
#define COMPONENT_BEAUTIFIED Ballistics
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BALLISTICS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BALLISTICS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BALLISTICS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MOA_TO_RAD(d) (d * 0.00029088) // Conversion factor: PI / 10800
