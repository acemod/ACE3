#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Interface to allow external modules to safely adjust pain levels.
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
//Only run on local units:
if (!local _unit) exitWith {ERROR("unit is not local");};
TRACE_3("ACE_DEBUG: adjustPainLevel Called",_unit, _pain, _addedPain);

//Ignore if medical system disabled:
if (GVAR(level) == 0) exitWith {};

private _pain = ((_unit getVariable [QGVAR(pain), 0]) + _addedPain) max 0;

_unit setVariable [QGVAR(pain), _pain];

//Start up the vital watching (if not already running)
[_unit] call FUNC(addVitalLoop);

_pain;
