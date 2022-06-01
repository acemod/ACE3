#include "script_component.hpp"
/*
 * Author: mharis001
 * Checks if BVM can be performed on the patient.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can BVM <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_canBVM
 *
 * Public: No
 */

params ["", "_patient"];

!(_patient call EFUNC(common,isAwake))
&& {(GVAR(advancedDiagnose) != 0) || {IN_CRDC_ARRST(_patient)}} // if basic diagnose, then only show action if appropriate (they can't tell difference between uncon/ca)
&& {isNull (_patient getVariable [QEGVAR(medical,air_provider), objNull])}
