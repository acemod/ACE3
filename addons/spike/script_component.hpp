#define COMPONENT spike
#define COMPONENT_BEAUTIFIED SPIKE
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SPIKE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPIKE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPIKE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define CAMERA_KEY_LEFT 0
#define CAMERA_KEY_RIGHT 1
#define CAMERA_KEY_UP 2
#define CAMERA_KEY_DOWN 3
#define CAMERA_KEY_ZOOM_IN 4
#define CAMERA_KEY_ZOOM_OUT 5
#define CAMERA_KEY_CHANGE_VISION_MODE 6
#define SPIKE_KEY_DESIGNATE 7
#define SPIKE_KEY_LEAVE 8

#define STAGE_LAUNCH 0
#define STAGE_CLIMB 1
#define STAGE_CRUISE 2
#define STAGE_TERMINAL 3

#define LAUNCH_TIME 3
#define CLIMB_TIME 5

#define LAUNCH_PITCH 45
#define CLIMB_PITCH 5

#define CRUISE_PRO_GAIN 0.3
#define CRUISE_DER_GAIN 3

#define BATTERY_LIFE (43 + random 10)

#define GIMBAL_LOGIC_OFFSET 10
