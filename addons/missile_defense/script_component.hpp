#define COMPONENT missile_defense
#define COMPONENT_BEAUTIFIED Missile Defense
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_TRACKING_INFO
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSILE_DEFENSE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSILE_DEFENSE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSILE_DEFENSE
#endif

#define LAUNCH_STATE_IDLE 0
#define LAUNCH_STATE_TRACKING 1
#define LAUNCH_STATE_COOLDOWN 2

#include "\z\ace\addons\main\script_macros.hpp"
