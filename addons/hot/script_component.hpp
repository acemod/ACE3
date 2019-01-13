#define COMPONENT hot
#define COMPONENT_BEAUTIFIED HOT
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HOT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HOT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HOT
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define RANDOM_VECTOR_3D (call {\
    private _z = random 2 - 1;\
    private _r = sqrt (1 - _z^2);\
    private _theta = random 360;\
    [_r * cos _theta, _r * sin _theta, _z]\
})

#define DEFAULT_CORRECTION_DISTANCE 10
#define DEFAULT_LEAD_DISTANCE 50

