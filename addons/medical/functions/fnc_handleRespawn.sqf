/*
 * Author: Zakant
 * Handles respawn of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_fnc_handleRespawn
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_unit"];
TRACE_2("handleRespawn",_unit,local _unit);

if (!local _unit) exitWith {};

_unit call FUNC(init); // Call init to reset the medical states for the unit.
[_unit, GVAR(STATE_MACHINE), _unit call FUNC(getUnitState), "Default"] call CBA_statemachine_fnc_manualTransition; // Move the unit to the default medical state
#ifdef DEBUG_MODE_FULL
private _state = [_unit, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
TRACE_1("current state",_state);
#endif

