/*
 * Author: commy2
 * Checks if the player can interact with civilian
 *
 * Arguments:
 * 0: Target <OBJECT>
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

params ["_unit", "_isCivilian"];

if (isNil "_isCivilian") then {_isCivilian = true};

alive _unit
&& [side _unit != side ACE_player, side group _unit == civilian] select _isCivilian
//&& {count (weapons _unit) == 0}
