/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret of a vehicle object can hold according to config.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Path <ARRAY>
 *
 * Return Value:
 * Magazine classes in TurretPath <ARRAY>
 *
 * Example:
 * [vehicle, [0]] call ace_rearm_fnc_getVehicleMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_turretPath", [], [[]]]
];

if (isNull _vehicle) exitWith {[]};

([typeOf _vehicle, _turretPath] call FUNC(getConfigMagazines))
