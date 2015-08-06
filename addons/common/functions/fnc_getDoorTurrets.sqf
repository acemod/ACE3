/*
 * Author: bux578
 *
 * Gets the turret index of door gunners
 *
 * Argument:
 * 0: Vehicle (Object)
 *
 * Return value:
 * Turret indexes of the door gunner. Empty array means no gunner position. (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turrets", "_doorTurrets", "_config"];

params ["_vehicle"];

_turrets = allTurrets [_vehicle, true];

_doorTurrets = [];

{
    _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if ((getNumber (_config >> "isCopilot") == 0) && count (getArray (_config >> "weapons")) > 0 ) then {
        _doorTurrets pushBack _x;
    };
} count _turrets;

_doorTurrets
