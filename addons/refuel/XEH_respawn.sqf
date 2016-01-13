#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

[_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
_unit setVariable [QGVAR(isRefueling), false];
