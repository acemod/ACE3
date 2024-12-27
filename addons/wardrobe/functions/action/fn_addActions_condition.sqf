#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to check if the player has an item that can be modified.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_player"];

missionNamespace getVariable [QSET(enable), false] && { count ([_player] call FUNC(getItems_modifiable_current)) > 0 }