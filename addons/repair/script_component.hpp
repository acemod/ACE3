#define COMPONENT repair
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_REPAIR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REPAIR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REPAIR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define TRACK_HITPOINTS ["HitLTrack", "HitRTrack"]
