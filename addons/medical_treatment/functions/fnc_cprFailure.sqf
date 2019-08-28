#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles failure of the CPR treatment.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_cprFailure
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("cprFailure",_medic,_patient);

_patient setVariable [QEGVAR(medical,CPR_provider), objNull, true];
