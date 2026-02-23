#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Adds a SpO2 duty factor. 1 is no effect, 0 is completely blocked breathing.
 *
 * Arguments:
 * 0: Factor ID <STRING>
 * 1: Factor <NUMBER or CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID", 0.8] call ace_medical_vitals_fnc_addSpO2DutyFactor
 *
 * Public: No
 */
params [["_id", "", [""]], ["_factor", 1, [0, {}]]];
if (_id == "" || {_factor isEqualTo 1}) exitWith {};

GVAR(spo2DutyList) set [_id, _factor];
