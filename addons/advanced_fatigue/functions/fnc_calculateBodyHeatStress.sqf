/*
* Author: Pasrules
* Calculates body heat stress
*
* Arguments:
* 0: bodyTemperature <NUMBER>
*
* Return Value:
* heatStress <NUMBER>
*
* Example
* [37] call ace_advanced_fatigue_fnc_calculateBodyHeatStress
*/

#include "script_component.hpp"
params ["_bodyTemp"];

private _male = [87,177,37];
private _normalTemp = _male select 2;
private _tempDif = (_bodyTemp - _normalTemp);
private _heatStress = 0;

// Check if overheating
if (_tempDif > 2) then {
    _heatStress = (500 * _tempDif);
};

_heatStress;