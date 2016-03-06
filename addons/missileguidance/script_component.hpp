#define COMPONENT missileguidance
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSILEGUIDANCE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSILEGUIDANCE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSILEGUIDANCE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define FIREMODE_DIRECT_LOAL 1