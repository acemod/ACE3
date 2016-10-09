/*
* Author: Pasrules
* Calculates body shiver
*
* Arguments:
* 0: bodyTemperature <NUMBER>
*
* Return Value:
* shiver <NUMBER>
*
* Example
* [37] call ace_advanced_fatigue_fnc_calculateBodyShiver
*/

#include "script_component.hpp"
params ["_bodyTemp"];

private _male = [87,177,37];
private _normalTemp = _male select 2;
private _tempDif = _bodyTemp - _normalTemp;
private _shiver = 0;

// Check if shivering
if (_tempDif < -1.5) then {
    _shiver = 500 * (abs _tempDif - 1.5);
};

_shiver;