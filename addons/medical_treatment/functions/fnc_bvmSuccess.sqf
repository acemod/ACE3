#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles finishing performing BVM on the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_bvmSuccess
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("bvmSuccess",_medic,_patient);

_patient setVariable [QEGVAR(medical,air_provider), objNull, true];
_patient setVariable [QEGVAR(medical,air_supliment), 0, true];
