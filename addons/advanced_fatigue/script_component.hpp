#define COMPONENT advanced_fatigue
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ADVANCED_FATIGUE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ADVANCED_FATIGUE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADVANCED_FATIGUE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define VO2MAX 52
#define VO2MAXPOWER 291.616
#define PEAKPOWER 1195.6256
#define REE 81.89
// We do not simulate respiration, so instead we set the oxygen percentage to a constant
#define OXYGEN 0.9
// The value of WATTSPERATP has been adjusted to fit the graphs
#define WATTSPERATP 10
