#define COMPONENT iron_dome
#define COMPONENT_BEAUTIFIED Iron Dome
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_TRACKING_INFO
// #define DEBUG_MODE_FULL
 #define DISABLE_COMPILE_CACHE
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

// How long it takes to recycle a target
#define RECYCLE_TIME 5
// how many error degrees the launcher has to be pointing toward the target
#define LAUNCH_ACCEPTABLE_ANGLE 10
// How fast the launcher launches
#define TIME_BETWEEN_LAUNCHES 1
// how many seconds does a launcher have to wait before re-engaging the same target
#define RE_ENGAGEMENT_TIME 5

// Proximity fuse range
#define PROX_RANGE 10

#include "\z\ace\addons\main\script_macros.hpp"
