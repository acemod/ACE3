#include "script_component.hpp"
/*
 * Author: Glowbal, SilentSpike
 * Get the cardiac output from the Heart, based on current Heart Rate and Blood Volume.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Current cardiac output (liter per second) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getCardiacOutput
 *
 * Public: No
 */

/*
    Cardiac output (Q or or CO ) is the volume of blood being pumped by the heart, in particular by a left or right ventricle in the CBA_missionTime interval of one second. CO may be measured in many ways, for example dm3/min (1 dm3 equals 1 liter).
    Source: http://en.wikipedia.org/wiki/Cardiac_output
*/

// Value taken from https://doi.org/10.1093%2Feurheartj%2Fehl336
// as 94/95 ml ± 15 ml
#define VENTRICLE_STROKE_VOL 95e-3

params ["_unit"];

private _bloodVolumeRatio = GET_BLOOD_VOLUME(_unit) / DEFAULT_BLOOD_VOLUME;
private _heartRate = GET_HEART_RATE(_unit);

// Blood volume ratio dictates how much is entering the ventricle (this is an approximation)
private _entering = linearConversion [0.5, 1, _bloodVolumeRatio, 0, 1, true];

private _cardiacOutput = (_entering * VENTRICLE_STROKE_VOL) * _heartRate / 60;

0 max _cardiacOutput
