#include "..\script_component.hpp"
/*
 * Author: Zakant
 * Handles starting the CPR treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_cprStart
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("cprStart",_medic,_patient);

_patient setVariable [QEGVAR(medical,CPR_provider), _medic, true];

if (alive _patient) exitWith {};

// Dead units are taken out of the statemachine, which means checking pulse while CPR is done on a dead unit will result in a HR of 0
// This is a workaround for that, as adding the unit back into the statemachine or never taking out would be too performance-intensive
_patient setVariable [VAR_HEART_RATE, random [25, 30, 35], true]; // value should match medical_vitals_fnc_updateHeartRate CPR value
