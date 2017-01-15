#define COMPONENT disarming
#define COMPONENT_BEAUTIFIED Disarming
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_DISARMING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DISARMING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DISARMING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DISARM_CONTAINER "GroundWeaponHolder"
#define DUMMY_ITEM "ACE_DebugPotato"
