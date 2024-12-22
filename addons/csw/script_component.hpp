#define COMPONENT csw
#define COMPONENT_BEAUTIFIED Crew-Served Weapons
#include "\z\ace\addons\main\script_mod.hpp"

// #define FAST_PROGRESSBARS
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_CSW
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CSW
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CSW
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define DISTANCE_FROM_GUN 1.5
#define RELATIVE_DIRECTION(direction) [DISTANCE_FROM_GUN, direction]

#ifdef FAST_PROGRESSBARS
    #define TIME_PROGRESSBAR(X) ((X) * 0.075)
#else
    #define TIME_PROGRESSBAR(X) ((X) * GVAR(progressBarTimeCoefficent))
#endif
