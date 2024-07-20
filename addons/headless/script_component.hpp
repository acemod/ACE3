#define COMPONENT headless
#define COMPONENT_BEAUTIFIED Headless
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HEADLESS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HEADLESS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HEADLESS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DELAY_DEFAULT 15

#define NO_REBALANCE 0
#define REBALANCE 1
#define FORCED_REBALANCE 2
