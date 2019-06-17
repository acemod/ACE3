#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles the progress of the CPR treatment.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic (not used) <OBJECT>
 *   1: Patient <OBJECT>
 *
 * Return Value:
 * Continue CPR <BOOL>
 *
 * Example:
 * [[player, cursorObject]] call ace_medical_treatment_fnc_cprProgress
 *
 * Public: No
 */

params ["_args"];
_args params ["", "_patient"];

// Cancel CPR is patient wakes up
if (_patient getVariable EFUNC(common,isAwake) || {!IN_CRDC_ARRST(_patient)}) exitWith {false};

// Calculate blood volume, if there is no pulse nothing happens
_patient call FUNC(calculateBlood);

true
