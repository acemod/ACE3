#define COMPONENT missile_cruise
#define COMPONENT_BEAUTIFIED Cruise-Missiles
#include "\z\ace\addons\main\script_mod.hpp"

 #define DEBUG_MODE_FULL
 #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS
 #define DEBUG_DRAW_CONTOURS

#ifdef DEBUG_ENABLED_CRUISE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CRUISE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CRUISE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define NAVIGATION_STATE_LAUNCH 0
#define NAVIGATION_STATE_FLIGHT 1
#define NAVIGATION_STATE_TERMINAL 2

#define SEEKER_STATE_LAUNCH 0
#define SEEKER_STATE_FLIGHT 1
#define SEEKER_STATE_SCAN 2

#define TERCOM_PRECISION 25
#define WAYPOINT_COMPLETION_RADIUS 50
#define GPS_INACCURACY 10
#define CLOCK_INACCURACY 1e-4
