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

#define MIN_INCREMENT 0.05 // mrad

#define DEFAULT_RAIL_BASE_ANGLE 0.0086 // deg

#define MIN_ZOOM_NAKEDEYE 0.2 // Magnification (CfgWeapons opticsZoomMax) that will always be unachievable by the naked eye

// #define DISABLE_DISPERSION

#ifdef DEBUG_ENABLED_SCOPES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SCOPES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SCOPES
#endif

#include "\z\ace\addons\main\script_macros.hpp"
