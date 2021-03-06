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

// Value is taken because with cardic output and resistance at default values, it will put blood pressure High at 120.
#define MODIFIER_BP_HIGH    9.4736842

// Value is taken because with cardic output and resistance at default values, it will put blood pressure Low at 80.
#define MODIFIER_BP_LOW     6.3157894

// Value that gives MAP=107 at default values
#define MODIFIER_BP 8.2168

params ["_unit"];

private _cardiacOutput = [_unit] call FUNC(getCardiacOutput);
private _resistance = _unit getVariable [VAR_PERIPH_RES, DEFAULT_PERIPH_RES];
private _meanPressure = _cardiacOutput * _resistance * MODIFIER_BP;

private _heartRate = GET_HEART_RATE(_unit);
private _stFraction = 0.01*exp(4.14-40.74/_heartRate);
private _strokeVol = [_unit] call FUNC(getStrokeVolume);
private _pulsePressure = 40*(_strokeVol/0.095)*(_resistance/DEFAULT_PERIPH_RES);

[round(_meanPressure - _pulsePressure*_stFraction), round(_meanPressure + _pulsePressure*_stFraction), round _meanPressure];
