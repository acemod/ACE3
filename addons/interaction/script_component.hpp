#define COMPONENT interaction
#define COMPONENT_BEAUTIFIED Interaction
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INTERACTION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTERACTION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTERACTION
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MACRO_DOOR_REACH_DISTANCE (AGLToASL positionCameraToWorld [0,0,0] vectorDistance AGLToASL (ACE_player modelToWorld (ACE_player selectionPosition "Head"))) + 2

// here is most suitable mass for all vanilla, CUP and RHS statics ATM (ZU-23 suits, D-30 and M119 don't suit)
#define FLIP_MAX_STATICWEAPON_MASS 2000
