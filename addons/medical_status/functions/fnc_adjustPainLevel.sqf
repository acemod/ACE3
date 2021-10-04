#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Interface to allow external modules to affect the pain level
 * Sets the new pain level to the max between the input and current level
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Desired pain level (0 .. 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [guy, 0.5] call ace_medical_status_fnc_adjustPainLevel
 *
 * Public: No
 */

params ["_unit", "_desiredPainLevel"];

if (!local _unit) exitWith { ERROR("unit is not local"); };

TRACE_2("adjustPainLevel",_unit,_desiredPainLevel);

_desiredPainLevel = _desiredPainLevel * EGVAR(medical,painCoefficient);

private _pain = GET_PAIN(_unit);
_pain = 0 max (_pain max _desiredPainLevel) min 1;

_unit setVariable [VAR_PAIN, _pain];
