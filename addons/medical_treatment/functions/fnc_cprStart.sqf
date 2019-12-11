#include "script_component.hpp"
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
