#define COMPONENT common
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMON
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define VERSION_CONFIG_COMMON VERSION_CONFIG;\
    versionDesc = "ACE 3";\
    versionAct = QUOTE(call COMPILE_FILE(init_versionTooltip))
