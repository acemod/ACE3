/*
 * Author: commy2
 * Checks if the unit can interact with civilian
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target has to be on the civilian side (default: true) <BOOL>
 *
 * Return Value:
 * Able to interact with civilian <BOOL>
 *
 * Example:
 * [target] call ace_interaction_fnc_canInteractWithCivilian
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", ["_isCivilian", true]];

alive _unit && [side _unit != side ACE_player, side group _unit == civilian] select _isCivilian // return
