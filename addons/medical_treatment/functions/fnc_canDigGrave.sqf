#include "script_component.hpp"
/*
 * Author: Ruthberg, commy2, esteldunedain, drofseh
 * Checks if a unit can dig a grave at the position of the patient.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_canDigGrave
 *
 * Public: No
 */

params ["", "_patient"];

GVAR(allowGaveDigging) && {_patient call EFUNC(common,canDig)}
