#define COMPONENT repair
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_REPAIR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REPAIR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REPAIR
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define IGNORED_HITPOINTS ["HitGlass1", "HitGlass2", "HitGlass3", "HitGlass4", "HitGlass5", "HitGlass6", "HitGlass7", "HitGlass8", "HitGlass9", "HitGlass10", "HitGlass11", "HitGlass12", "HitGlass13", "HitGlass14", "HitGlass15", "HitRGlass", "HitLGlass", "Glass_1_hitpoint", "Glass_2_hitpoint", "Glass_3_hitpoint", "Glass_4_hitpoint", "Glass_5_hitpoint", "Glass_6_hitpoint", "Glass_7_hitpoint", "Glass_8_hitpoint", "Glass_9_hitpoint", "Glass_10_hitpoint", "Glass_11_hitpoint", "Glass_12_hitpoint", "Glass_13_hitpoint", "Glass_14_hitpoint", "Glass_15_hitpoint", "Glass_16_hitpoint", "Glass_17_hitpoint", "Glass_18_hitpoint", "Glass_19_hitpoint", "Glass_20_hitpoint"]
#define TRACK_HITPOINTS ["HitLTrack", "HitRTrack"]
