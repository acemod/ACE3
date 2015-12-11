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

params ["_target", "_unit", "_vehicle"];  // _target is for future possible finite ammo, _unit placeholder

[
    10,
    _vehicle,
    FUNC(rearmEntireVehicleSuccess),
    "",
    format [localize LSTRING(BasicRearmAction), getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
