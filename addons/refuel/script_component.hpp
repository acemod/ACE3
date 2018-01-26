#define COMPONENT refuel
#define COMPONENT_BEAUTIFIED Refuel
#include "\z\ace\addons\main\script_mod.hpp"

// #define FAST_PROGRESSBARS
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

#define REFUEL_INFINITE_FUEL -10
#define REFUEL_DISABLED_FUEL -1
#define REFUEL_ACTION_DISTANCE 7
#define REFUEL_NOZZLE_ACTION_DISTANCE 2
#define REFUEL_PROGRESS_DURATION 2

#ifdef FAST_PROGRESSBARS
    #define TIME_PROGRESSBAR(X) ((X) * 0.075)
#else
    #define TIME_PROGRESSBAR(X) (X)
#endif

#define INTERACT_EXCEPTIONS_REFUELING "isNotInside", "isNotOnLadder", "isNotSwimming"
#define INTERACT_EXCEPTIONS INTERACT_EXCEPTIONS_REFUELING, "isNotRefueling"
