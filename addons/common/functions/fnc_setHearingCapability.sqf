#include "..\script_component.hpp"
/*
 * Author: Glowbal, BaerMitUmlaut, Jouklik
 * Handle set volume calls. Will use the lowest available volume setting.
 *
 * Arguments:
 * 0: ID <STRING>
 * 1: Settings <NUMBER>
 * 2: Add (true) or remove (false) <BOOL> (default: true)
 * 3: Volume fade duration <NUMBER> (default: 0)
 * 4: ID Headphones <STRING> (default: ID)
 * 5: Settings Headphones <NUMBER> (default: Settings)
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
params ["", "", "", "", ["_idHeadphones", _id], ["_settingHeadphones", _setting]];

private _fnc_lowestVolume = {
    params ["_id", "_setting", "_capabilityMap"];

    _id = toLowerANSI _id;

    // Save setting
    if (_add) then {
        _capabilityMap set [_id, _setting];
    } else {
        _capabilityMap deleteAt _id;
    };

    private _volumes = values _capabilityMap;

    // If no deafening volumes are left, put it back to default
    if (_volumes isEqualTo []) then {
        1
    } else {
        selectMin _volumes
    }
};

private _lowestVolume  = [_id, _setting, GVAR(setHearingCapabilityMap)] call _fnc_lowestVolume;
private _lowestVolumeHeadphones = [_idHeadphones, _settingHeadphones, GVAR(setHearingCapabilityMapHeadphones)] call _fnc_lowestVolume;

// In-game sounds
_fadeDuration fadeSound _lowestVolume;
_fadeDuration fadeRadio _lowestVolumeHeadphones;
if (GVAR(allowFadeMusic)) then {
    _fadeDuration fadeMusic _lowestVolumeHeadphones;
};

// Set radio mod variables
ACE_player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
