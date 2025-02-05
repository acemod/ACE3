#define COMPONENT hearing
#define COMPONENT_BEAUTIFIED Hearing
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HEARING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HEARING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HEARING
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "\z\ace\addons\hearing\script_macros_hearingProtection.hpp"

#define UPDATE_HEARING -1

// Electronic hearing protection FX
#define EHP_REDUCTION 0.3
#define EHP_MIN_STRENGTH 0.07
#define EHP_TIMEOUT 0.6
#define EHP_FADE_IN 0.25

// Vehicle explosion hearing damage
#define VEHICLE_EXPLOSION_STRENGTH 200
#define VEHICLE_EXPLOSION_BIG_STRENGTH 500
