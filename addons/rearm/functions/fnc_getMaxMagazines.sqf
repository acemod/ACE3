/*
 * Author: GitHawk, Jonpas
 * Calculates the maximum number of magazines a turret can hold according to config.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magazine Classname <STRING>
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

if !(isClass _cfg) exitWith {0};

_count = {_x == _magazine} count getArray (_cfg  >> "magazines");
_count
