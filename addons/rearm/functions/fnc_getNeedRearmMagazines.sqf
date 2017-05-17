/*
 * Author: GitHawk, Jonpas
 * Get rearm return value.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * Return Value <ARRAY>
 * 0: Can Rearm <BOOL>
 * 1: TurretPath <ARRAY>
 * 2: Number of current magazines in turret path <NUMBER>
 *
 * Example:
 * [tank, "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getNeedRearmMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_magazineClass", "", [""]]
];

private _return = [false, [], 0];
{
    private _magazines = [_vehicle, _x] call FUNC(getVehicleMagazines);

    if (_magazineClass in _magazines) then {
        private _currentMagazines = {_x == _magazineClass} count (_vehicle magazinesTurret _x);

        if ((_vehicle magazineTurretAmmo [_magazineClass, _x]) < getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count")) exitWith {
            _return = [true, _x, _currentMagazines];
        };

        if (_currentMagazines < ([_vehicle, _x, _magazineClass] call FUNC(getMaxMagazines))) exitWith {
            _return = [true, _x, _currentMagazines];
        };
    };

    if (_return select 0) exitWith {};
    false
} count REARM_TURRET_PATHS;

_return
