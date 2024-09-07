#define COMPONENT frag
#define COMPONENT_BEAUTIFIED Frag
#include "\z\ace\addons\main\script_mod.hpp"

// #define LOG_FRAG_INFO
// #define DEBUG_MODE_FULL
// #define DEBUG_MODE_DRAW
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FRAG
    #define DEBUG_MODE_FULL
    #define DEBUG_MODE_DRAW
#endif

#ifdef DEBUG_SETTINGS_FRAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FRAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Mimimum hold-off time between frag events per unit
#define ACE_FRAG_FRAG_UNIT_HOLDOFF 0.5
#define ACE_FRAG_SPALL_UNIT_HOLDOFF 0.5
// Scaling for the min/max # of fragments since last frag event
#define ACE_FRAG_COUNT_MIN_TIME 0.1
#define ACE_FRAG_COUNT_MIN 5
#define ACE_FRAG_COUNT_MAX_TIME 1.5
#define ACE_FRAG_COUNT_MAX 50
#define ACE_FRAG_IMPERIC_VELOCITY_CONSTANT 0.8
#define ACE_FRAG_DEFAULT_FRAG_TYPES [\
    QGVAR(tiny), QGVAR(tiny), QGVAR(tiny),\
    QGVAR(tiny_HD), QGVAR(tiny_HD), QGVAR(tiny_HD),\
    QGVAR(small), QGVAR(small), QGVAR(small), QGVAR(small),\
    QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD),\
    QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD)\
]
