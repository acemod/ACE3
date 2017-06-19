/*
 * Author: Glowbal
 * Handle set volume calls. Will use the lowest available volume setting.
 *
 * Arguments:
 * 0: id <STRING>
 * 1: settings <NUMBER>
 * 2: add [true] OR remove [false] (default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["earwax", 0.5, true] call ace_common_fnc_setHearingCapability
 *
 * Public: Yes
 */
#include "script_component.hpp"

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
0 fadeMusic _lowestVolume;

// Set Radio mod variables.
ACE_player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
