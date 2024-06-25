#define COMPONENT iron_dome
#define COMPONENT_BEAUTIFIED Iron Dome
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_TRACKING_INFO
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_IRON_DOME
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_IRON_DOME
    #define DEBUG_SETTINGS DEBUG_SETTINGS_IRON_DOME
#endif

#define LAUNCH_STATE_IDLE 0
#define LAUNCH_STATE_TRACKING 1
#define LAUNCH_STATE_FIRING 2
#define LAUNCH_STATE_COOLDOWN 3

#include "\z\ace\addons\main\script_macros.hpp"
