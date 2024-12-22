#define COMPONENT vehiclelock
#define COMPONENT_BEAUTIFIED Vehicle Lock
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_VEHICLELOCK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VEHICLELOCK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_VEHICLELOCK
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IS_KIND_OF_ANY(object,classnames) ((classnames) findIf {(object) isKindOf _x} > -1)
