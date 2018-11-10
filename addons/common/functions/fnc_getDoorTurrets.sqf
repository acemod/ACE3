#include "script_component.hpp"
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
 * Example:
 * [car] call ace_common_fnc_getDoorTurrets
 *
 * Public: Yes
 */

params ["_vehicle"];

private _turrets = allTurrets [_vehicle, true];

private _doorTurrets = [];

{
    private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (((getNumber (_config >> "isCopilot")) == 0) && {count getArray (_config >> "weapons") > 0}) then {
        _doorTurrets pushBack _x;
    };
    false
} count _turrets;

_doorTurrets
