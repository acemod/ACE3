/*
 * Author: commy2
 * Get the turret index of a vehicles gunner.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle Gunner Turret indecies <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

private ["_turrets", "_turret", "_config"];

_turrets = allTurrets [_vehicle, true];

_turret = [];

{
    _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (getNumber (_config >> "primaryGunner") == 1) exitWith {
        _turret = _x;
    };
    false
} count _turrets;

_turret
