#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if the player can open a unit's backpack.
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

params ["_target", "_player"];

private _backpackContainer = backpackContainer _target;

!isNull _backpackContainer &&
{!lockedInventory _backpackContainer} &&
{maxLoad _backpackContainer > 0} &&
{getNumber (configOf _backpackContainer >> "disableInventory") != 1}
