/*
 * Author: GitHawk
 * Starts progress bar for rearming an entire vehicle.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Vehicle to be armed <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, player, tank] call ace_rearm_fnc_rearmEntireVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_truck", "_player", "_vehicle"];

[
    TIME_PROGRESSBAR(10),
    [_truck, _player, _vehicle],
    FUNC(rearmEntireVehicleSuccess),
    "",
    format [localize LSTRING(BasicRearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],
    {
        params ["_args"];
        _args params ["", "_player", "_vehicle"];
        (_player distance _vehicle) < (REARM_ACTION_DISTANCE + 2)
    },
    ["isnotinside"]
] call EFUNC(common,progressBar);
