#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if the player can open a unit's backpack.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_interaction_fnc_canOpenBackpack
 *
 * Public: No
 */

params ["_player", "_target"];

private _backpackContainer = backpackContainer _target;

!isNull _backpackContainer &&
{!lockedInventory _backpackContainer} &&
{maxLoad _backpackContainer > 0} &&
{getNumber (configOf _backpackContainer >> "disableInventory") != 1}
