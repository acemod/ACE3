#define COMPONENT nametags
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_NAMETAGS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NAMETAGS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NAMETAGS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ICON_NONE 0
#define ICON_NAME 1
#define ICON_NAME_RANK 2
#define ICON_NAME_SPEAK 3
#define ICON_SPEAK 4
