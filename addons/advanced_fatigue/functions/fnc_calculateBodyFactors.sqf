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
if (_tempDif > 1.5) then { // Check if overheating
    _heatStress = 500 * (_tempDif - 1.5);
};

private _sweat = 0;
if (_tempDif > 0) then { // Check if sweating
    _sweat = _tempDif / 2;
};

private _shiver = 0;
if (_tempDif < -1.5) then { // Check if shivering
    _shiver = 500 * (abs _tempDif - 1.5);
};

[_heatStress,_sweat,_shiver];
