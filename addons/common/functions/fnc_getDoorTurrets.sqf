#include "..\script_component.hpp"
/*
 * Author: bux578
 * Returns all turret indices of door gunners.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * All turret indices of the Vehicle <ARRAY>
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
    private _config = configOf _vehicle;

    _config = [_config, _x] call FUNC(getTurretConfigPath);

    if (((getNumber (_config >> "isCopilot")) == 0) && {getArray (_config >> "weapons") isNotEqualTo []}) then {
        _doorTurrets pushBack _x;
    };
} forEach _turrets;

_doorTurrets
