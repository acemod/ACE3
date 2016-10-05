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
if (_tempDif > 0) then {
    _sweat = _tempDif;
    if (_sweat > 2) then {
        _sweat = 2;
    };
};

_sweat;