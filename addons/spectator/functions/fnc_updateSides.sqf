#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Adds or removes sides from the selection available to spectate. Local effect.
 *
 * Default selection is [west,east,resistance,civilian]
 *
 * Arguments:
 * 0: Sides to add <ARRAY>
 * 1: Sides to remove <ARRAY>
 *
 * Return Value:
 * Sides available <ARRAY>
 *
 * Example:
 * [[west], [east,civilian]] call ace_spectator_fnc_updateSides
 *
 * Public: Yes
 */

params [["_addSides",[],[[]]], ["_removeSides",[],[[]]]];

// Add and remove sides
_addSides append (GVAR(availableSides) - _removeSides);

// Only need array of unique sides
_addSides = _addSides arrayIntersect _addSides;

GVAR(availableSides) = _addSides;

_addSides
