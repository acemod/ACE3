#define COMPONENT arsenal
#define COMPONENT_BEAUTIFIED Arsenal
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ARSENAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ARSENAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ARSENAL
#endif

#ifdef DISABLE_COMPILE_CACHE
    #define RECOMPILE
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define USE_WRAPPER(func,wrp) \
    if !(missionNamespace getVariable QGVAR(replaceBIS)) exitWith {_this call BIS_fnc_##func##BIS}; \
    _this call FUNC(DOUBLES(wrapper,wrp))
