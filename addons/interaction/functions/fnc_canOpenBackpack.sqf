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
 * [cursorObject, player] call ace_interaction_fnc_canOpenBackpack
 *
 * Public: No
 */

params ["_player", "_target"];

private _backpackContainer = backPackContainer _target;

!isNull _backpackContainer &&
{!lockedInventory _backpackContainer} &&
{maxLoad _backpackContainer > 0} &&
{getNumber (_backpackConfig >> "disableInventory") != 1} &&
{!(_target isKindOf QEGVAR(dragging,clone))}
