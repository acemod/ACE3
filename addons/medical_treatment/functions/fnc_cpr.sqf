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
 * [player, cursorObject] call ace_medical_treatment_fnc_cpr
 *
 * Public: No
 */

params ["_medic", "_patient"];

_patient setVariable [QGVAR(isReceivingCPR), false, true];
_patient setVariable [VAR_HEART_RATE, 0, true];
_patient call FUNC(calculateBlood);

if (alive _patient && {IN_CRDC_ARRST(_patient)}) then {
    [QGVAR(cprLocal), [_medic, _patient], _patient] call CBA_fnc_targetEvent;
};
