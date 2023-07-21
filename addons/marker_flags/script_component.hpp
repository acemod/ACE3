#define COMPONENT marker_flags
#define COMPONENT_BEAUTIFIED Marker Flags
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MARKER_FLAGS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_MARKER_FLAGS
    #define DEBUG_SETTINGS DEBUG_ENABLED_MARKER_FLAGS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1

#define MIN_HEIGHT -0.3
#define MAX_HEIGHT 0.4

#define FLAG_PLACING_DISTANCE 2
