#include "script_component.hpp"
/*
 * Author: commy2
 * Checks if the unit can interact with civilian
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Target has to be on the civilian side (default: true) <BOOL>
 *
 * Return Value:
 * Able to interact with civilian <BOOL>
 *
 * Example:
 * [target] call ace_interaction_fnc_canInteractWithCivilian
 *
 * Public: No
 */

params ["_unit", "_target", ["_isCivilian", true]];
alive _target && [side _target != side _unit, side group _target == civilian] select _isCivilian // return
