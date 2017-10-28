/*
 * Author: SilentSpike
 * Adds or removes spectator vision modes from the selection available to the local player.
 *
 * Possible vision modes are:
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: White hot
 *   -  1: Black hot
 *   -  2: Light Green Hot / Darker Green cold
 *   -  3: Black Hot / Darker Green cold
 *   -  4: Light Red Hot / Darker Red Cold
 *   -  5: Black Hot / Darker Red Cold
 *   -  6: White Hot / Darker Red Cold
 *   -  7: Thermal (Shade of Red and Green, Bodies are white)
 *
 * Default selection is [-2,-1,0,1]
 *
 * Arguments:
 * 0: Vision modes to add <ARRAY>
 * 1: Vision modes to remove <ARRAY>
 *
 * Return Value:
 * Available vision modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateVisionModes
 *
 * Public: Yes
 */

#include "script_component.hpp"

if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [DFUNC(updateVisionModes),_this];
};

params [["_addModes",[],[[]]], ["_removeModes",[],[[]]]];

private _currentModes = GVAR(availableVisions);

// Restrict additions to only possible values
private _newModes = _addModes arrayIntersect [-2,-1,0,1,2,3,4,5,6,7];
_newModes append (_currentModes - _removeModes);

_newModes = _newModes arrayIntersect _newModes;
_newModes sort true;

// Can't become an empty array
if (_newModes isEqualTo []) then {
    WARNING("Cannot remove all spectator vision modes");
} else {
    GVAR(availableVisions) = _newModes;
};

// Update camera in case of change
if !(isNil QGVAR(camera)) then {
    [GVAR(camVision)] call FUNC(cam_setVisionMode);
};

_newModes
