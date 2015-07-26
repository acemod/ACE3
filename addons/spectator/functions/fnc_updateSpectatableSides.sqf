/*
 * Author: SilentSpike
 * Adds or removes sides from the selection available to spectate by the local player.
 * Note that the side filter setting is applied to the available sides dynamically.
 *
 * Default selection is [west,east,resistance,civilian]
 *
 * Arguments:
 * 0: Sides to add <ARRAY>
 * 1: Sides to remove <ARRAY>
 *
 * Return Value:
 * Spectatable sides <ARRAY>
 *
 * Example:
 * [[west], [east,civilian]] call ace_spectator_fnc_updateSpectatableSides
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_addSides",[],[[]]], ["_removeSides",[],[[]]]];

// Add and remove sides
_addSides append (GVAR(availableSides) - _removeSides);

// Only need array of unique sides
_addSides arrayIntersect _addSides;

GVAR(availableSides) = _addSides;

_addSides
