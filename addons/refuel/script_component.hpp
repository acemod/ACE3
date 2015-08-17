#define COMPONENT refuel
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_SETTINGS DEBUG_ENABLED_REFUEL
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define INFINITE_FUEL -1
#define REFUEL_ACTION_DISTANCE 7
