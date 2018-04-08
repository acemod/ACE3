/*
 * Author: Tuupertunut
 * Returns all turrets in a vehicle.
 *
 * BIS command "allTurrets" does not return the driver turret at the time of writing (2017-07-16).
 * This function just adds driver turret to the array returned by "allTurrets".
 *
 * Arguments:
 * 0: Vehicle <OBJECT><STRING>
 *
 * Return Value:
 * Turret paths <ARRAY>
 *
 * Example:
 * [vehicle] call ace_rearm_fnc_getAllRearmTurrets
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];

private _turrets = if (_vehicle isEqualType objNull) then {
    allTurrets _vehicle;
} else {
    [_vehicle] call BIS_fnc_allTurrets; // "Does what allTurrets command does, except the param is vehicle's config class name"
};

// Adding the driver turret "[-1]".
_turrets pushBack [-1];

_turrets
