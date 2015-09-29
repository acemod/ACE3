/*
 * Author: Glowbal
 * Handle set volume calls. Will use the lowest available volume setting.
 *
 * Arguments:
 * 0: id <STRING>
 * 1: settings <NUMBER>
 * 2: add (default: true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 *
 * Note: uses player
 */
#include "script_component.hpp"

params ["_id", "_settings", ["_add", true]];

private ["_map", "_exists", "_lowestVolume"];

_map = missionNamespace getVariable [QGVAR(setHearingCapabilityMap),[]];

_exists = false;
{
    if (_id == _x select 0) exitWith {
        _exists = true;
        if (_add) then {
            _x set [1, _settings];
        } else {
            _map set [_forEachIndex, 0];
            _map = _map - [0];
        };
    };
} forEach _map;

if (!_exists && _add) then {
    _map pushBack [_id, _settings];
};

missionNamespace setVariable [QGVAR(setHearingCapabilityMap), _map];

// find lowest volume
_lowestVolume = 1;
{
    _lowestVolume = (_x select 1) min _lowestVolume;
    false
} count _map;

// in game sounds
0 fadeSound _lowestVolume;
0 fadeRadio _lowestVolume;
0 fadeMusic _lowestVolume;

// Set Radio mod variables.
player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
