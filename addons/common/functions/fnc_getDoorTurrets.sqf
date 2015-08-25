/*
 * Author: bux578
 * Returns all turret indecies of door gunners.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * All turret indecies of the Vehicle <ARRAY>
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
    nil
} count _turrets;

_doorTurrets
