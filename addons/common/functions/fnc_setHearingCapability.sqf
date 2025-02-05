#include "..\script_component.hpp"
/*
 * Author: Glowbal, BaerMitUmlaut
 * Handle set volume calls. Will use the lowest available volume setting.
 *
 * Arguments:
 * 0: ID <STRING>
 * 1: Settings <NUMBER>
 * 2: Add (true) or remove (false) <BOOL> (default: true)
 * 3: Volume fade duration <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["earwax", 0.5, true] call ace_common_fnc_setHearingCapability
 *
 * Public: Yes
 */

params ["_id", "_setting", ["_add", true], ["_fadeDuration", 0]];

_id = toLowerANSI _id;

// Save setting
if (_add) then {
    GVAR(setHearingCapabilityMap) set [_id, _setting];
} else {
    GVAR(setHearingCapabilityMap) deleteAt _id;
};

private _lowestVolume = selectMin values GVAR(setHearingCapabilityMap);

// In-game sounds
_fadeDuration fadeSound _lowestVolume;
_fadeDuration fadeRadio _lowestVolume;
if (GVAR(allowFadeMusic)) then {
    _fadeDuration fadeMusic _lowestVolume;
};

// Set radio mod variables
ACE_player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
