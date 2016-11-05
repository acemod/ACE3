#define COMPONENT safemode
#define COMPONENT_BEAUTIFIED Safe Mode
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SAFEMODE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SAFEMODE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SAFEMODE
#endif

#include "\z\ace\addons\main\script_macros.hpp"
