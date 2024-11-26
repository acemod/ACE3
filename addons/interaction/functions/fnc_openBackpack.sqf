#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Opens a unit's backpack.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_interaction_fnc_openBackpack
 *
 * Public: No
 */

params ["_player", "_target"];

private _backpack = backpackContainer _target;
_player action ["Gear", _backpack];

if ("ace_backpacks" call EFUNC(common,isModLoaded) && {_backpack call EFUNC(backpacks,isBackpack)}) then {
    ["ace_backpackOpened", [_target, _backpack], _target] call CBA_fnc_targetEvent;
};
