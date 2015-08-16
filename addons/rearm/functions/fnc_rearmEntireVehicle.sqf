/*
 * Author: GitHawk
 * Rearms an entire vehicle
 *
 * Arguments:
 * 0: The Ammo Truck <OBJECT>
 * 1: The Player <OBJECT>
 * 2: The Vehicle to be armed <OBJECT>
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

private ["_ammo", "_tmpCal", "_cal"];
params ["_target","_unit","_vehicle"];

[
    10,
    _vehicle,
    FUNC(rearmEntireVehicleSuccess),
    "",
    format [localize LSTRING(BasicRearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);