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
 * Example:
 * [player] call ace_medical_statemachine_fnc_resetStateDefault
 *
 * Public: No
 */

params ["_unit"];

// Statemachine only handles local units
if !(local _unit) exitWith {};

[_unit, EGVAR(medical,STATE_MACHINE), "Dead", "Default"] call CBA_statemachine_fnc_manualTransition;
