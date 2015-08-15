/*
 * Author: GitHawk
 * Calculates the maximum number of magazines a turret can hold according to config
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: The Turretpath <ARRAY>
 * 2: The Magazine <STRING>
 *
 * Return Value:
 * Number of magazines on the turret path <NUMBER>
 *
 * Example:
 * [vehicle, [0], "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getMaxMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_count", "_cfg"];
params ["_target", "_turretPath", "_magazine"];

if (isNull _target) exitWith {0};
_count = 0;

// TODO replace by loop or method of interpreting _turretPath

_cfg = configFile;
switch (_turretPath) do {
    case [0] : {
        _cfg = configFile >> "CfgVehicles" >> (typeOf _target) >> "Turrets";
        if (count _cfg > 0) then {
            _cfg = _cfg select 0;
        } else {
            _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
        };
    };
    case [1] : {
         _cfg = configFile >> "CfgVehicles" >> (typeOf _target) >> "Turrets";
        if (count _cfg > 0) then {
            _cfg = _cfg select 1;
        } else {
            _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
        };
    };
    case [2] : {
        _cfg = configFile >> "CfgVehicles" >> (typeOf _target) >> "Turrets";
        if (count _cfg > 0) then {
            _cfg = _cfg select 2;
        } else {
            _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
        };
    };
    case [0,0] : {
        _cfg = configFile >> "CfgVehicles" >> (typeOf _target) >> "Turrets";
        if (count _cfg > 0) then {
            _cfg = (_cfg select 0) >> "Turrets";
            if (count _cfg > 0) then {
                _cfg = _cfg select 0;
            } else {
                _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
            };
        } else {
            _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
        };
    };
    case [0,1] : {
        if (count _cfg > 0) then {
            _cfg = (_cfg select 0) >> "Turrets";
            if (count _cfg > 0) then {
                _cfg = _cfg select 1;
            } else {
                _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
            };
        } else {
            _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
        };
    };
    default {
        _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
    };
};

if !(isClass _cfg) exitWith {0};

_count = {_x == _magazine} count getArray (_cfg  >> "magazines");
_count