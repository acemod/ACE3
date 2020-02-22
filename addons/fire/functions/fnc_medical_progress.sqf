#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Makes object catch fire. Only call from events
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
 *   1: Patient <OBJECT>
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
_args params ["_medic", "_patient"];

[_patient] call FUNC(isBurning);
