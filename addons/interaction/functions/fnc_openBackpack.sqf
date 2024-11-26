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

_player action ["OpenBag", _target];
