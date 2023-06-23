#define COMPONENT refuel
#define COMPONENT_BEAUTIFIED Refuel
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_HOOKS_POS
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_SETTINGS DEBUG_ENABLED_REFUEL
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\z\ace\addons\refuel\defines.hpp"

#define INTERACT_EXCEPTIONS_REFUELING "isNotInside", "isNotOnLadder", "isNotSwimming"
#define INTERACT_EXCEPTIONS INTERACT_EXCEPTIONS_REFUELING, "isNotRefueling"
