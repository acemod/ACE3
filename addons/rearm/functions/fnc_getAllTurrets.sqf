/*
 * Author: Tuupertunut
 * Returns all turrets in a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Turret paths <ARRAY>
 *
 * Example:
 * [vehicle] call ace_rearm_fnc_getAllTurrets
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {[]};

private _turrets = allTurrets _vehicle;

// Adding the driver turret "[-1]".
_turrets pushBack [-1];

_turrets
