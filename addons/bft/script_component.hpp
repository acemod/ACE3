#define COMPONENT bft
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BFT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BFT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BFT
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#include "device_getters.hpp"
