#define COMPONENT towing
#define COMPONENT_BEAUTIFIED Towing
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TOWING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TOWING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TOWING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define TOW_ACTION_DISTANCE 3
#define INTERACTION_EXCEPTIONS "isNotInside", "isNotOnLadder", "isNotSwimming"

#define TOW_STATE_ATTACH_PARENT 0
#define TOW_STATE_ATTACH_CHILD 1
#define TOW_STATE_ATTACH 2
#define TOW_STATE_CANCEL 3
#define TOW_STATE_CLEANUP 4

