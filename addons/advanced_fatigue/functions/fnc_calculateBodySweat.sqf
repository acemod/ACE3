/*
* Author: Pasrules
* Calculates body sweat
*
* Arguments:
* 0: bodyTemperature <NUMBER>
*
* Return Value:
* sweat <NUMBER>
*
* Example
* [37] call ace_advanced_fatigue_fnc_calculateBodySweat
*/

#include "script_component.hpp"
params ["_bodyTemp"];

private _male = [87,177,37];
private _normalTemp = _male select 2;
private _tempDif = (_bodyTemp - _normalTemp);
private _sweat = 0;

// Check if sweating
if (_tempDif > 0.5) then {
    _sweat = (_tempDif - 0.5) / 2;
    if (_sweat > 1) then {
        _sweat = 1;
    };
};

_sweat;