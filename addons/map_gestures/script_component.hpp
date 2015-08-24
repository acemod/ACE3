#define COMPONENT map_gestures
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_MAP_GESTURES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAP_GESTURES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAP_GESTURES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MAP_GESTURES_NO_OWNER_ID_EVENT "PlayerNameHasNoOwnerID"
