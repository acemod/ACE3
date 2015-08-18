/*
 * Author: GitHawk, Jonpas
 * Get rearm return value.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * Return Value <ARRAY>
 * 0: Can Rearm <BOOL>
 * 1: TurretPath <ARRAY>
 * 2: Magazine Classname <STRING>
 *
 * Example:
 * [tank, "mag"] call ace_rearm_fnc_getNeedRearmMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_return", "_magazines", "_cnt"];
params ["_target", "_magazineClass"];

_return = [false, [], 0];
{
    _magazines = _target magazinesTurret _x;

    if (_magazineClass in _magazines) then {
        _cnt = {_x == _magazineClass} count _magazines;

        if ((_target magazineTurretAmmo [_magazineClass, _x]) < getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count")) exitWith {
            _return = [true, _x, _cnt];
        };

        if (_cnt < ([_target, _x, _magazineClass] call FUNC(getMaxMagazines))) exitWith {
            _return = [true, _x, _cnt];
        };
    };

    if (_return select 0) exitWith {};
} forEach REARM_TURRET_PATHS;

_return
