#define COMPONENT scopes
#define COMPONENT_BEAUTIFIED Scopes
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#define ELEVATION_UP   0
#define ELEVATION_DOWN 1
#define WINDAGE_LEFT   2
#define WINDAGE_RIGHT  3

#define MINOR_INCREMENT false
#define MAJOR_INCREMENT true

#define DEFAULT_RAIL_BASE_ANGLE 0.0086

// Converts rifle/ammo precision (a) into dispersion config values (b)
// Meets the following criteria:
// 68.3 % of the shots land within a circle of diameter (1a)
// 99.6 % of the shots land within a circle of diameter (2a)
#define PRECISION_TO_DISPERSION(d) ((d) * 0.562) // empirical data

#ifdef DEBUG_ENABLED_SCOPES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SCOPES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SCOPES
#endif

#include "\z\ace\addons\main\script_macros.hpp"
