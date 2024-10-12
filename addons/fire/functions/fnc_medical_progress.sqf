#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if patient is still burning for medical progress to continue.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Medic (not used) <OBJECT>
 * - 1: Patient <OBJECT>
 *
 * Return Value:
 * Continue pat down <BOOL>
 *
 * Example:
 * [[player, cursorObject]] call ace_fire_fnc_medical_progress
 *
 * Public: No
 */

params ["_args"];
_args params ["", "_patient"];

_patient call FUNC(isBurning)
