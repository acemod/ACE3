#include "script_component.hpp"

params ["_unit", "_damages"];

private _fireDamage = 0;
{
    _x params ["", "", "_damage"];
    _fireDamage = _fireDamage + _damage;
} forEach _damages;

private _intensity = linearConversion [0, 20, _fireDamage, 0, 10, true];
systemChat format ["intensity - %1, damage - %2", _intensity, _fireDamage];

if (_intensity > 1) then {
    ["ace_fire_burn", [_unit, _intensity]] call CBA_fnc_globalEvent;
};

_this // return
