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


// if use just GVAR here, "Undefined variable" error occurs
#define WAIT_AND_CHECK_SETTING(func) \
    if (is3DEN || {missionName isEqualTo 'Arsenal'}) exitWith {_this call DOUBLES(BIS_fnc,func)BIS}; \
    if !(missionNamespace getVariable QEGVAR(common,settingsInitFinished)) exitWith { \
        EGVAR(common,runAtSettingsInitialized) pushBack [ARR_2(LINKFUNC(DOUBLES(wrapper,func)),_this)]; \
        TRACE_1(QUOTE(not ready func),_this);\
    }; \
    if !(missionNamespace getVariable QGVAR(replaceBIS)) exitWith {_this call DOUBLES(BIS_fnc,func)BIS}

#define USE_WRAPPER(wrp) \
    _this call FUNC(DOUBLES(wrapper,wrp))
