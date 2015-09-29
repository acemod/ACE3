#define COMPONENT interaction
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_INTERACTION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTERACTION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTERACTION
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MACRO_DOOR_REACH_DISTANCE (AGLToASL positionCameraToWorld [0,0,0] vectorDistance AGLToASL (ACE_player modelToWorld (ACE_player selectionPosition "Head"))) + 2
