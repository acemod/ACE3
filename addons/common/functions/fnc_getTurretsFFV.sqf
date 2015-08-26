/*
 * Author: commy2
 * Get the turret indices of ffv turrets.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Vehicle FFV Turret indecies <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turrets", "_turret", "_config"];

params ["_vehicle"];

_turrets = allTurrets [_vehicle, true];

_turret = [];
{
    _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (getNumber (_config >> "isPersonTurret") == 1) then {
        _turret pushBack _x;
    };
    true
} count _turrets;
_turret
