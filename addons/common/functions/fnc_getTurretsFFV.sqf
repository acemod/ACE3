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
 * Public: Yes
 */
#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]]];

private _turrets = allTurrets [_vehicle, true];

private _turret = [];

{
    private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (getNumber (_config >> "isPersonTurret") == 1) then {
        _turret pushBack _x;
    };
    false
} count _turrets;

_turret
