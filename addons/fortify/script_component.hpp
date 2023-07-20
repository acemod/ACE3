#define COMPONENT fortify
#define COMPONENT_BEAUTIFIED Fortify
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FORTIFY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FORTIFY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FORTIFY
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#include "\a3\ui_f\hpp\defineDIKCodes.inc"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1
