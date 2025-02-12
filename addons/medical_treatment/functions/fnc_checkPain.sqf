#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks the pain status of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_checkPain
 *
 * Public: No
 */

params ["_medic", "_patient"];
private _output = "%1 is not in pain";

// Check if patient has pulse
if (IN_CRDC_ARRST(_patient)) then {
	_output = "%1 is not responsive";
} else {
	// Check if in pain
	if (GET_PAIN_PERCEIVED(_patient) > 0) then {
		_output = "%1 is in pain";
		// Check if in heavy pain
		if (GET_PAIN_PERCEIVED(_patient) > 0.5) then {
			_output = "%1 is in severe pain";
		};
	}; 
};

[[_output, _patient call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);
[_patient, "quick_view", _output, [[_patient, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
