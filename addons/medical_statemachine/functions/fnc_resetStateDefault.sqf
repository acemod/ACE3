#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Resets the default state on a unit after respawning.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

[_unit, EGVAR(medical,STATE_MACHINE), "Dead", "Default"] call CBA_statemachine_fnc_manualTransition;
