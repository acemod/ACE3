/*
 * Author: SilentSpike
 * Adds or removes spectator camera modes from the selection available to the local player.
 * Possible camera modes are:
 *   - 0: Freecam
 *   - 1: Internal
 *   - 2: External
 *
 * Arguments:
 * 0: Camera modes to add <ARRAY>
 * 1: Camera modes to remove <ARRAY>
 *
 * Return Value:
 * Available camera modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateCameraModes
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_addModes",[],[[]]], ["_removeModes",[],[[]]]];

// Restrict additions to only possible values
_addModes = _addModes arrayIntersect [0,1,2];
_addModes sort true;

// Remove and add new modes
GVAR(availableModes) = GVAR(availableModes) - _removeModes;

GVAR(availableModes) append _addModes;
GVAR(availableModes) arrayIntersect GVAR(availableModes);
GVAR(availableModes) sort true;

GVAR(availableModes)
