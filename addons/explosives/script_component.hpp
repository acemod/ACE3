#define COMPONENT explosives
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_EXPLOSIVES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EXPLOSIVES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EXPLOSIVES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1
