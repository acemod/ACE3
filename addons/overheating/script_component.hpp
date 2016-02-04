#define COMPONENT overheating
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_OVERHEATING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_OVERHEATING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_OVERHEATING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define TEMP_TOLERANCE 50

#ifdef DEBUG_MODE_FULL
    #define TRACE_PROJECTILE_INFO(BULLET) _vdir = vectorNormalized velocity BULLET; _dir = (_vdir select 0) atan2 (_vdir select 1); _up = asin (_vdir select 2); _mv = vectorMagnitude velocity BULLET; TRACE_3("adjusted projectile",_dir,_up,_mv);
#else
    #define TRACE_PROJECTILE_INFO(BULLET) /* noDebug */
#endif
