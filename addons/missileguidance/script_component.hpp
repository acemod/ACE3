#define COMPONENT missileguidance
#define COMPONENT_BEAUTIFIED Missile Guidance
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_GUIDANCE_INFO
// #define ENABLE_PROJECTILE_CAMERA
// #define DEBUG_MODE_FULL
 #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSILEGUIDANCE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSILEGUIDANCE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSILEGUIDANCE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define RANDOM_VECTOR_3D (call {\
    private _z = random 2 - 1;\
    private _r = sqrt (1 - _z^2);\
    private _theta = random 360;\
    [_r * cos _theta, _r * sin _theta, _z]\
})

#define DEFAULT_CORRECTION_DISTANCE 2
#define DEFAULT_LEAD_DISTANCE 5
#define ACTIVE_RADAR_POLL_FREQUENCY (1 / 7)
#define ACTIVE_RADAR_MINIMUM_SCAN_AREA 30


#define GPS_UI_TOO 1704211
#define GPS_UI_PB 1704112
#define GPS_UI_PB_MISSION 1704113
#define GPS_UI_PB_MISSION_BACKWARD 1704114
#define GPS_UI_PB_MISSION_FORWARD 1704115
#define GPS_UI_EASTING 1704116
#define GPS_UI_NORTHING 1704117
#define GPS_UI_HEIGHT 1704118
#define GPS_UI_ANGLE 1704119
#define GPS_UI_HEADING 1704120

#define CONTROLS_DISABLED_IN_TOO [GPS_UI_PB_MISSION_BACKWARD, GPS_UI_PB_MISSION_FORWARD, GPS_UI_EASTING, GPS_UI_NORTHING, GPS_UI_HEIGHT]

#define MAX_PB_MODES 6

