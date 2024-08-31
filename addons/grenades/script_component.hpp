#define COMPONENT grenades
#define COMPONENT_BEAUTIFIED Grenades
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_GRENADES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GRENADES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GRENADES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define EFFECT_SIZE 1

#define MIN_EXPLOSION_TIME_FOR_ROLL 1
