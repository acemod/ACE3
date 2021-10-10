#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Public interface to allow external modules to safely adjust pain levels.
 * Added pain can be positive or negative (Note: ignores painCoefficient setting)
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Added ammount of pain (can be negative) <NUMBER>
 *
 * Return Value:
 * The new pain level <NUMBER>
 *
 * Example:
 * [guy, 0.5] call ace_medical_fnc_adjustPainLevel
 *
 * Public: Yes
 */

params ["_unit", "_addedPain"];

if (!local _unit) exitWith { ERROR_1("unit [%1] is not local",_unit); };

private _pain = GET_PAIN(_unit);

_pain = 0 max (_pain + _addedPain) min 1;

_unit setVariable [VAR_PAIN, _pain];
