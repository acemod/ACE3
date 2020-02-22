#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Returns if unit can pat down fire or not
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Can Pat-Down <BOOL>
 *
 * Example:
 * [nil, player] call ace_fire_fnc_medical_canPatDown
 *
 * Public: No
 */
params ["", "_patient"];

[_patient] call FUNC(isBurning);

