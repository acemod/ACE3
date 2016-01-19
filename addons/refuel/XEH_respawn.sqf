#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

[_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
_unit setVariable [QGVAR(isRefueling), false];
