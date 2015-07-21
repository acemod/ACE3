/*
 * Author: SilentSpike
 * Adds or removes spectator camera modes from the selection available to the local player.
 * Possible camera modes are:
 *   - 0: Free
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
private ["_newModes","_currentModes"];

_currentModes = GVAR(availableModes);

// Restrict additions to only possible values
_newModes = _addModes arrayIntersect [0,1,2];
_newModes append (_currentModes - _removeModes);

_newModes arrayIntersect _newModes;
_newModes sort true;

// Can't become an empty array
if (_newModes isEqualTo []) then {
    [["[ACE Spectator]","Cannot remove all camera modes"]] call EFUNC(common,displayTextStructured);
} else {
    GVAR(availableModes) = _newModes;
};

// Update camera in case of change
if !(isNil QGVAR(camera)) then {
    [] call FUNC(transitionCamera);
};

_newModes
