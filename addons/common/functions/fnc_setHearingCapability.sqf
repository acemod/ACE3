/**
 * fn_setHearingCapability.sqf
 * @Descr: Handle set volume calls. Will use the lowest available volume setting.
 * @Author: Glowbal
 *
 * @Arguments: [id STRING, settings NUMBER, add BOOL (Optional. True will add, false will remove. Default value is true)]
 * @Return: nil
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_add", "_exists", "_map", "_lowestVolume"];

PARAMS_2(_id,_settings);

_add = true;
if (count _this > 2) then {
    _add = _this select 2;
};

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
} forEach _map;

// in game sounds
0 fadeSound _lowestVolume;
0 fadeRadio _lowestVolume;
0 fadeMusic _lowestVolume;

// Set Radio mod variables.
player setVariable ["tf_globalVolume", _lowestVolume];
if (!isNil "acre_api_fnc_setGlobalVolume") then { [_lowestVolume^0.33] call acre_api_fnc_setGlobalVolume; };
