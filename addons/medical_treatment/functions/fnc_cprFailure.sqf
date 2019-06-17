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

params ["", "_patient"];

if (!(_patient call EFUNC(common,isAwake)) || {IN_CRDC_ARRST(_patient)}) then {
    _patient setVariable [VAR_HEART_RATE, 0, true];
};

// Patient is no longer receiving CPR
_patient setVariable [QGVAR(isReceivingCPR), false, true];

_patient call FUNC(calculateBlood);
