#define COMPONENT medical
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define USE_WOUND_EVENT_SYNC false
