#include "script_component.hpp"
/*
 * Author: Glowbal
 * Calculate the blood pressure of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * 0: BloodPressure Low <NUMBER>
 * 1: BloodPressure High <NUMBER>
 * 2: Mean Arterial Pressure <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getBloodPressure
 *
 * Public: No
 */

// Value that gives MAP=107 at default values
#define MODIFIER_BP 8.2168

params ["_unit"];

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
private _resistance = _unit getVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES];
private _meanPressure = _cardiacOutput * _resistance * MODIFIER_BP;

private _heartRate = GET_HEART_RATE(_unit);

//https://www.researchgate.net/publication/14609651_Calculation_of_Mean_Arterial_Pressure_During_Exercise_as_a_Function_of_Heart_Rate
private _stFraction = 0 max (0.01*exp(4.14-40.74/_heartRate)) min 0.5;

private _strokeVol = [_unit] call FUNC(getStrokeVolume);
private _pulsePressure = (DEFAULT_BP_HIGH - DEFAULT_BP_LOW) * (_strokeVol / DEFAULT_STROKE_VOLUME) * (_resistance / DEFAULT_PERIPH_RES);

private _bpLow = _meanPressure - _pulsePressure*_stFraction;
[round _bpLow, round (_bpLow + _pulsePressure), round _meanPressure];
