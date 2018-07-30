#include "script_component.hpp"
/*
 * Author: Zakant
 * Gets the name of the current medical state of an unit. Unit has to be local to the caller.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Name of the current medical state of the unit <STRING>
 *
 * Example:
 * [player] call ace_medical_fnc_getUnitState
 *
 * Public: Yes
 */

params ["_unit"];

if (!local _unit) exitWith { ERROR("unit is not local"); };

[_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState
