#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks the response status of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_checkResponse
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _output = [LSTRING(Check_Response_Unresponsive), LSTRING(Check_Response_Responsive)] select (_patient call EFUNC(common,isAwake));
[[_output, _patient call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);

[_patient, "quick_view", _output, [[_patient, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
