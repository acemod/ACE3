#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRearm), nil];
_unit setVariable [QGVAR(carriedMagazine), nil];
_dummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummy) then {
    detach _dummy;
    deleteVehicle _dummy;
};
_unit setVariable [QGVAR(dummy), nil];