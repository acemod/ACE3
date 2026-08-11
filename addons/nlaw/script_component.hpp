#define COMPONENT nlaw
#define COMPONENT_BEAUTIFIED NLAW
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_NLAW_INFO
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_NLAW
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NLAW
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NLAW
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define SEEKER_STATE_LOOKING 0
#define SEEKER_STATE_TERMINAL 1
#define SEEKER_STATE_DETONATED 2

// (vt=d), (200 * FUZE_LENGTH = distance)
#define FUZE_LENGTH (0.0075)
