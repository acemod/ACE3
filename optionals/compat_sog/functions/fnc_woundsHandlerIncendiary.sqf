#include "script_component.hpp"

params ["_unit", "_damages"];

private _fireDamage = 0;
{
    _x params ["", "_hitpoint", "_damage"];
    if (_hitpoint == "#structural") exitWith {_fireDamage = _damage};
} forEach _damages;


private _intensity = linearConversion [0, 3, _fireDamage, 0, 10, true];
systemChat format ["intensity - %1, damage - %2", _intensity, _fireDamage];

["ace_fire_burn", [_unit, _intensity]] call CBA_fnc_globalEvent;

_this // return
