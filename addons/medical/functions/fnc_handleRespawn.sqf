/*
 * Author: Zakant
 * Handles respawn of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

_unit call FUNC(init); // Call init to reset the medical states for the unit.
[GVAR(STATE_MACHINE), _unit call FUNC(getUnitState), "DEFAULT"] call CBA_statemachine_fnc_manualTransition; // Move the unit to the default medical state
