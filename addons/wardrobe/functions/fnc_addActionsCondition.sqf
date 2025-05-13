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
 * [_player] call ace_wardrobe_fnc_addActionsCondition
 *
 * Public: No
 */

params ["_player"];

isNil QGVAR(api_disable)
&&
{
    missionNamespace getVariable [QGVAR(set_enableAction), false]
    &&
    { 
        count ([_player] call FUNC(getItemsModifiableCurrent)) > 0
    }
}
