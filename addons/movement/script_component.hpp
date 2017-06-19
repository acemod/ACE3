#define COMPONENT movement
#define COMPONENT_BEAUTIFIED Movement
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MOVEMENT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_MOVEMENT
    #define DEBUG_SETTINGS DEBUG_ENABLED_MOVEMENT
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define FACTOR_POUND_TO_KILOGRAMM 1/2.2046
