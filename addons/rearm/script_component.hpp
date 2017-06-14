#define COMPONENT rearm
#define COMPONENT_BEAUTIFIED Rearm
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS
// #define FAST_PROGRESSBARS

#ifdef DEBUG_ENABLED_REARM
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REARM
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REARM
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define REARM_ACTION_DISTANCE 7
#define REARM_TURRET_PATHS [[-1], [0], [0,0], [0,1], [1], [2], [0,2]]

#define REARM_CALIBERS        [  6,   7,   8,  13, 19, 20, 25, 30, 35, 39, 40, 60, 70, 80, 82, 100, 105, 120, 122, 125, 155, 230, 250]
#define REARM_DURATION_TAKE   [  5,   5,   5,   5,  5,  5,  5,  5,  5,  5,  5,  3,  3,  3,  3,   3,   4,   5,   5,   5,   5,  13,  10]
#define REARM_DURATION_REARM  [ 10,  10,  10,  10, 10, 10, 10, 10, 10, 10, 10,  7,  7,  7,  7,   7,   8,  10,  10,  10,  10,  27,  20]
#define REARM_COUNT           [500, 500, 400, 100, 50, 50, 40, 25, 34, 24, 10,  2,  2,  2,  2,   1,   1,   1,   1,   1,   1,   1,   1]


#define REARM_HOLSTER_WEAPON \
    _unit setVariable [QGVAR(selectedWeaponOnRearm), currentWeapon _unit]; \
    TRACE_2("REARM_HOLSTER_WEAPON",_unit,currentWeapon _unit); \
    _unit action ["SwitchWeapon", _unit, _unit, 299];

#define REARM_UNHOLSTER_WEAPON \
    _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRearm); \
    if (!isNil "_weaponSelect") then { \
        TRACE_2("REARM_UNHOLSTER_WEAPON",_unit,_weaponSelect); \
        _unit selectWeapon _weaponSelect; \
        _unit setVariable [QGVAR(selectedWeaponOnRearm), nil]; \
    };

#ifdef FAST_PROGRESSBARS
    #define TIME_PROGRESSBAR(X) ((X) * 0.075)
#else
    #define TIME_PROGRESSBAR(X) (X)
#endif
