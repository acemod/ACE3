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

#define REFUEL_HOLSTER_WEAPON \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), currentWeapon _unit]; \
    _unit action ["SwitchWeapon", _unit, _unit, 99];

#define REFUEL_UNHOLSTER_WEAPON \
    _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRefuel); \
    _unit selectWeapon _weaponSelect; \
    _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
