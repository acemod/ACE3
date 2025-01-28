#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Modifies the ACE_OpenBackpack action to show backpack name.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, [], []] call ace_interaction_fnc_modifyOpenBackpackAction
 *
 * Public: No
 */

params ["_target", "_player", "", "_actionData"];

private _backpack = backpackContainer _target;
private _actionText = format [localize "STR_ACTION_OPEN_BAG", getText (configOf _backpack >> "displayName")];
TRACE_3("",_target,_backpack,_actionText);

_actionData set [1, _actionText];
