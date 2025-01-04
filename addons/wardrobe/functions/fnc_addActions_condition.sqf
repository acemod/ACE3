#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Condition check: Is wardrobe enabled & if the player has an item that can be modified
 *
 * Arguments:
 * 0: _player from the Ace Action <STRING>
 *
 * Return Value:
 * condition <BOOL>
 *
 * Example:
 * [_player] call ace_wardrobe_fnc_addActions_condition
 *
 * Public: No
 */

params ["_player"];

missionNamespace getVariable [QSET(enable_action), false]
&&
{ 
    count ([_player] call FUNC(getItems_modifiable_current)) > 0
}
