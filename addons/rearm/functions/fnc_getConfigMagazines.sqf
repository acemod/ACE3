/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret can hold according to config.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Turret Path <ARRAY>
 *
 * Return Value:
 * Magazine classes in TurretPath <ARRAY>
 *
 * Example:
 * [vehicle, [0]] call ace_rearm_fnc_getMaxMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_turretPath"];

if (isNull _target) exitWith {[]};

_cfg = configFile >> "CfgVehicles" >> (typeOf _target) >> "Turrets";

if (count _turretPath == 1) then {
    _turretPath params ["_subPath"];

    if (_subPath == -1) exitWith {
        _cfg = configFile >> "CfgVehicles" >> (typeOf _target);
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
