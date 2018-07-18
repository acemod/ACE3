/*
 * Author: Glowbal
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

#include "script_component.hpp"

/*
    Cardiac output (Q or or CO ) is the volume of blood being pumped by the heart, in particular by a left or right ventricle in the CBA_missionTime interval of one second. CO may be measured in many ways, for example dm3/min (1 dm3 equals 1 litre).
    Source: http://en.wikipedia.org/wiki/Cardiac_output
*/

// to limit the amount of complex calculations necessary, we take a set modifier to calculate Stroke Volume.
#define MODIFIER_CARDIAC_OUTPUT     19.04761

params ["_unit"];

private _bloodVolume = (GET_BLOOD_VOLUME(_unit) / DEFAULT_BLOOD_VOLUME) * 100;
private _heartRate = GET_HEART_RATE(_unit);
private _cardiacOutput = ((_bloodVolume / MODIFIER_CARDIAC_OUTPUT) + ((_heartRate / DEFAULT_HEART_RATE) - 1)) / 60;

(0 max _cardiacOutput)
