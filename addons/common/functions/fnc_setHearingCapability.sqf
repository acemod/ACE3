#include "..\script_component.hpp"
/*
<<<<<<< HEAD
 * Author: Glowbal
=======
 * Author: Glowbal, BaerMitUmlaut
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 * Handle set volume calls. Will use the lowest available volume setting.
 *
 * Arguments:
 * 0: ID <STRING>
 * 1: Settings <NUMBER>
 * 2: Add (true) or remove (false) <BOOL> (default: true)
<<<<<<< HEAD
=======
 * 3: Volume fade duration <NUMBER> (default: 0)
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 *
 * Return Value:
 * None
 *
 * Example:
 * ["earwax", 0.5, true] call ace_common_fnc_setHearingCapability
 *
 * Public: Yes
 */

<<<<<<< HEAD
params ["_id", "_setting", ["_add", true]];

private _exists = false;
private _lowestVolume = 1;

GVAR(setHearingCapabilityMap) = GVAR(setHearingCapabilityMap) select {
    _x params ["_xID", "_xSetting"];
    if (_id == _xID) then {
        _exists = true;
        if (_add) then {
            _x set [1, _setting];
            _lowestVolume = _lowestVolume min _setting;
            true
        } else {
            false
        };
    } else {
        _lowestVolume = _lowestVolume min _xSetting;
        true
    };
};

if (!_exists && _add) then {
    _lowestVolume = _lowestVolume min _setting;
    GVAR(setHearingCapabilityMap) pushBack [_id, _setting];
};

// in game sounds
0 fadeSound _lowestVolume;
0 fadeRadio _lowestVolume;
if (GVAR(allowFadeMusic)) then {
    0 fadeMusic _lowestVolume;
};

// Set Radio mod variables.
=======
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
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
ACE_player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
