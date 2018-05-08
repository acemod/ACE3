/*
 * Author: PabstMirror
 * Interface to allow external modules to affect the pain level
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Desired pain level (0 .. 1) <NUMBER>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [guy, 0.5] call ace_medical_fnc_adjustPainLevel
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_desiredPainLevel"];

if (!local _unit) exitWith { ERROR("unit is not local"); };

TRACE_2("adjustPainLevel",_unit,_desiredPainLevel);

_desiredPainLevel = _desiredPainLevel * GVAR(painCoefficient);

private _pain = GET_PAIN_TOTAL(_unit);

SET_PAIN_TOTAL(_unit,_pain max _desiredPainLevel,false);
