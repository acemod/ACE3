#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles finishing performing CPR on the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_cprSuccess
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("cprSuccess",_medic,_patient);

_patient setVariable [QEGVAR(medical,CPR_provider), objNull, true];

if (alive _patient && {IN_CRDC_ARRST(_patient)}) then {
    TRACE_1("sending cprLocal event",_patient);
    [QGVAR(cprLocal), [_medic, _patient], _patient] call CBA_fnc_targetEvent;
} else {
    TRACE_1("not alive or in cardiac arrest",_patient);
};
