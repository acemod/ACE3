#include "script_component.hpp"
/*
 * Author: Ruthberg, commy2, esteldunedain, drofseh
 * Checks if a unit can dig a grave at the position of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_canDigGrave
 *
 * Public: No
 */

params ["", "_patient"];

GVAR(allowGraveDigging) && {_patient call EFUNC(common,canDig)}
