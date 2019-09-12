#include "script_component.hpp"
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

params ["_truck", "_player", "_vehicle"];
TRACE_3("rearmEntireVehicle",_truck,_player,_vehicle);

[
    TIME_PROGRESSBAR(10),
    [_truck, _vehicle, _player],
    {(_this select 0) call FUNC(rearmEntireVehicleSuccess)},
    "",
    format [localize LSTRING(BasicRearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],
    {
        param [0] params ["", "_vehicle", "_player"];
        _player distance _vehicle <= GVAR(distance);
    },
    ["isnotinside"]
] call EFUNC(common,progressBar);
