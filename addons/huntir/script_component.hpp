#define COMPONENT huntir
#define COMPONENT_BEAUTIFIED HuntIR
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HUNTIR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HUNTIR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HUNTIR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define HUNTIR_BACKGROUND_LAYER_ID 13521
#define HUNTIR_CAM_ROSE_LAYER_ID 13522

#define HUNTIR_MAX_TRANSMISSION_RANGE 1600
