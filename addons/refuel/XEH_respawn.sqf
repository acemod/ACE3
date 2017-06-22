#include "script_component.hpp"

params ["_unit"];

if !(local _unit) exitWith {};

[_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
_unit setVariable [QGVAR(isRefueling), false];
