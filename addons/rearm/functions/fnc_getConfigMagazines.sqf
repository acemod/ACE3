/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret of a vehicle class can hold according to config.
 *
 * Arguments:
 * 0: Vehicle class <STRING>
 * 1: Turret Path <ARRAY>
 *
 * Return Value:
 * Magazine classes in TurretPath <ARRAY>
 *
 * Example:
 * ["B_MBT_01_arty_F", [0]] call ace_rearm_fnc_getConfigMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_cfgString", "", [""]],
    ["_turretPath", [], [[]]]
];

if (_cfgString == "") exitWith {[]};

private _cfg = configFile >> "CfgVehicles" >> _cfgString >> "Turrets";

if !(isClass _cfg) exitWith {[]};

if (count _turretPath == 1) then {
    _turretPath params ["_subPath"];

    if (_subPath == -1) exitWith {
        _cfg = configFile >> "CfgVehicles" >> _cfgString;
    };

    if (count _cfg > _subPath) then {
        _cfg = _cfg select _subPath;
    } else {
        _cfg = nil;
    };
} else {
    _turretPath params ["", "_subPath"];
    if (count _cfg > 0) then {
        _cfg = (_cfg select 0) >> "Turrets";
        if (count _cfg > _subPath) then {
            _cfg = _cfg select _subPath;
        } else {
            _cfg = nil;
        };
    } else {
        _cfg = nil;
    };
};

if !(isClass _cfg) exitWith {[]};

getArray (_cfg  >> "magazines")
