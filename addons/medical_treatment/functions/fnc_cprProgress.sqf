#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles the progress of the CPR treatment.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
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
_args params ["_medic", "_patient"];

// Cancel CPR if patient wakes up

!(_patient call EFUNC(common,isAwake))
&& {(GVAR(advancedDiagnose) != 0) || {IN_CRDC_ARRST(_patient)}} // if basic diagnose, then only show action if appropriate (they can't tell difference between uncon/ca)
&& {_medic == (_patient getVariable [QEGVAR(medical,CPR_provider), objNull])}
