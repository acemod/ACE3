#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles failure of the bvm treatment.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_bvmFailure
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("bvmFailure",_medic,_patient);


_patient setVariable [QEGVAR(medical,air_provider), objNull, true];
_patient setVariable [QEGVAR(medical,air_supliment), 0, true];