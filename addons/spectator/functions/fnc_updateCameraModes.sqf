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

params [["_addModes",[],[[]]], ["_removeModes",[],[[]]], ["_CBASettingCall",false]];

// Use of the public API overrides the CBA setting
if (_CBASettingCall && {!isNil QGVAR(cameraModesBlockCBASetting)}) exitWith {};

if !(_CBASettingCall) then {
    GVAR(cameraModesBlockCBASetting) = true;
    WARNING_1("%1 has been called directly and CBA Setting for it has been blocked!",QFUNC(updateCameraModes));
};

// Camera modes must be sanitized to only possible values
private _newModes = _addModes arrayIntersect [0,1,2];
_newModes append (GVAR(availableModes) - _removeModes);

// Duplicate entries aren't desired
_newModes = _newModes arrayIntersect _newModes;
_newModes sort true;

// Can't become an empty array
if (_newModes isEqualTo []) then {
    ["Cannot remove all camera modes (%1)", QFUNC(updateCameraModes)] call BIS_fnc_error;
} else {
    GVAR(availableModes) = _newModes;
};

// Update camera in case of change
if (GVAR(isSet)) then {
    [] call FUNC(transitionCamera);
};

_newModes
