#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles starting the CPR treatment.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
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

params ["", "_patient"];

// Prevent others from performing CPR
_patient setVariable [QGVAR(isReceivingCPR), true, true];

// Create a random pulse based on setting
if (GVAR(cprCreatesPulse) && {GET_HEART_RATE(_patient) == 0}) then {
    _patient setVariable [VAR_HEART_RATE, round random [25, 30, 35], true];
};

_patient setVariable [QEGVAR(medical,lastTimeUpdated), CBA_missionTime, true];
