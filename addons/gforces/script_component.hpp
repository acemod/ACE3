#define COMPONENT gforces
#define COMPONENT_BEAUTIFIED G-Forces
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_GFORCES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GFORCES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GFORCES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define AVERAGEDURATION 6
#define INTERVAL 0.20
#define MAXVIRTUALG 5.0
#define MINVIRTUALG 2.5
