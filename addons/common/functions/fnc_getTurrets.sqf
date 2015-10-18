/*
 * Author: commy2
 * Get all turret indicies of a vehicle type.
 *
 * Arguments:
 * 0: Vehicle type <STRING>
 *
 * Return Value:
 * Turret Indecies <ARRAY>
 *
 * Public: Yes
 *
 * Note: It's advised to use allTurrets [_vehicle, true] instead whenever possible
 */
#include "script_component.hpp"

params ["_type"];

private ["_varName", "_turrets"];

_varName = format [QGVAR(CachedTurrets_%1), _type];
_turrets = + (uiNamespace getVariable _varName);

if (!isNil "_turrets") exitWith {_turrets};

private ["_config", "_fnc_addTurret"];

_config = configFile >> "CfgVehicles" >> _type;

_turrets = [];

_fnc_addTurret = {
    params ["_config", "_path"];

    _config = _config >> "Turrets";

    private ["_count", "_offset", "_path2", "_config2"];

    _count = count _config;

    _offset = 0;

    for "_index" from 0 to (_count - 1) do {
        _path2 = _path + [_index - _offset];
        _config2 = _config select _index;

        if (isClass _config2) then {
            _turrets pushBack _path2;
            [_config2, _path2] call _fnc_addTurret;
        } else {
            _offset = _offset + 1;
        };
    };
};

[_config, []] call _fnc_addTurret;

uiNamespace setVariable [_varName, _turrets];

_turrets
