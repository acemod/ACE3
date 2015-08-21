#define COMPONENT refuel
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_SETTINGS DEBUG_ENABLED_REFUEL
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define REFUEL_INFINITE_FUEL -1
#define REFUEL_ACTION_DISTANCE 7

#define REFUEL_DETACH_NOZZLE \
    detach _nozzle; \
    _nozzle setVariable [QGVAR(isRefueling), false, true];

#define REFUEL_DROP_NOZZLE \
    REFUEL_DETACH_NOZZLE \
    _nozzle setPosATL [(getPosATL _nozzle) select 0, (getPosATL _nozzle) select 1, 0];\
    _nozzle setVelocity [0, 0, 0];

#define REFUEL_UNIT_DROP_NOZZLE \
    REFUEL_DROP_NOZZLE \
    _unit setVariable [QGVAR(isRefueling), false]; \
    _unit setVariable [QGVAR(nozzle), objNull];

#define REFUEL_HOLSTER_WEAPON \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), currentWeapon _unit]; \
    _unit action ["SwitchWeapon", _unit, _unit, 99];

#define REFUEL_UNHOLSTER_WEAPON \
    _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRefuel); \
    _unit selectWeapon _weaponSelect; \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
