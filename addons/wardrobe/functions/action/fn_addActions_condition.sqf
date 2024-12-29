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

missionNamespace getVariable [QSET(enable_action), false]
&&
{ 
    count ([_player] call FUNC(getItems_modifiable_current)) > 0
}


// 1. Check if the player has items that can be modified
// 2. Get the target classnames and check if they are available.
// 