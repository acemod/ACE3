#define COMPONENT finger
#define COMPONENT_BEAUTIFIED Finger
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FINGER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FINGER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FINGER
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define BASE_SIZE 44

#define FP_TIMEOUT 2
#define FP_ACTION_TIMEOUT 1

#define FP_DISTANCE 5000
#define FP_RANDOMIZATION_X 0.0350
#define FP_RANDOMIZATION_Y 0.0100
