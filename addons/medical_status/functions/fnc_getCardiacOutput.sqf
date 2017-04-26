/*
 * Author: Glowbal
 * Get the cardiac output from the Heart, based on current Heart Rate and Blood Volume.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Current cardiac output (liter per second) <NUMBER>
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

if (_unit getVariable [QGVAR(inCardiacArrest), false]) exitWith { 0 };

private _bloodVolume = ((_unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME]) / DEFAULT_BLOOD_VOLUME) * 100;
private _heartRate = _unit getVariable [QGVAR(heartRate), DEFAULT_HEART_RATE];
private _cardiacOutput = ((_bloodVolume / MODIFIER_CARDIAC_OUTPUT) + ((_heartRate / DEFAULT_HEART_RATE) - 1)) / 60;

(0 max _cardiacOutput)
