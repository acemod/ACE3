#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Condition check: Is wardrobe enabled & if the player has an item that can be modified
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * condition <BOOL>
 *
 * Example:
 * _player call ace_wardrobe_fnc_addActionsCondition
 *
 * Public: No
 */

params ["_player"];

missionNamespace getVariable [QGVAR(enableAction), false]
&&
{ 
    _player call FUNC(getItemsModifiableCurrent) isNotEqualTo []
}
