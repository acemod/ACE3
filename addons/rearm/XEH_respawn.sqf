#include "script_component.hpp"

params ["_unit"];
if !(local _unit) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRearm), nil];
_unit setVariable [QGVAR(carriedMagazine), nil];
private _dummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummy) then {
    detach _dummy;
    deleteVehicle _dummy;
};
_unit setVariable [QGVAR(dummy), nil];
