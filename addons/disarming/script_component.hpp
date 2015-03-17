#define COMPONENT disarming
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_DISARMING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DISARMING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DISARMING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DUMMY_ITEM "ACE_DebugPotato"
#define UNIQUE_MAGAZINES ["ACE_key_customKeyMagazine"]