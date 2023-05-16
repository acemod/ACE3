#define COMPONENT markinglaser
#define COMPONENT_BEAUTIFIED Marking Laser
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MARKINGLASER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MARKINGLASER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MARKINGLASER
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define LASER_MAX 3000
#define UPDATE_INTERVAL 1

#define TYPE_OBJECT "OBJECT"
#define TYPE_GROUND "GROUND"
#define TYPE_VECTOR "VECTOR"
