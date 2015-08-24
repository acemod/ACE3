#define COMPONENT repair
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_REPAIR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REPAIR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REPAIR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IGNORED_HITPOINTS ["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitGlass9","HitGlass10","HitGlass11","HitGlass12","HitGlass13","HitGlass14","HitGlass15","HitRGlass","HitLGlass"]
// #define TRACK_HITPOINTS ["HitLTrack", "HitRTrack"];
