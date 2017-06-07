/*
* Author: Pasrules
* Calculates body factors
*
* Arguments:
* 0: bodyTemperature <NUMBER>
*
* Return Value:
* 0: heatStress <NUMBER>
* 1: sweat <NUMBER>
* 2: shiver <NUMBER>
*
* Example
* [37] call ace_advanced_fatigue_fnc_calculateBodyFactors
*/

#include "script_component.hpp"
params ["_bodyTemp"];

private _tempDif = (_bodyTemp - MALE_TEMPERATURE);

private _heatStress = 0;
// Check if overheating
if (_tempDif > 1.5) then {
    _heatStress = (500 * _tempDif);
};

private _sweat = 0;
// Check if sweating
if (_tempDif > 0) then {
    _sweat = _tempDif;
    _sweat min 2;
};

private _shiver = 0;
// Check if shivering
if (_tempDif < -1.5) then {
    _shiver = 500 * (abs _tempDif);
};

[_heatStress,_sweat,_shiver];
