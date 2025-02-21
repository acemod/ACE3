#define COMPONENT laser_warning
#define COMPONENT_BEAUTIFIED Laser Warning System
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_LASER_WARNING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LASER_WARNING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LASER_WARNING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define PROCESS_DELAY (1 / 10)