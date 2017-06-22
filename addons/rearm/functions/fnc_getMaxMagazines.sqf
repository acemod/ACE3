/*
 * Author: GitHawk, Jonpas
 * Calculates the maximum number of magazines a turret can hold according to config.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magazine Classname <STRING>
 *
 * Return Value:
 * Number of magazines on the turret path <NUMBER>
 *
 * Example:
 * [vehicle, [0], "500Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getMaxMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_turretPath", [], [[]]],
    ["_magazineClass", "", [""]]
];

if (isNull _vehicle) exitWith {0};

private _count = {_x == _magazineClass} count ([_vehicle, _turretPath] call FUNC(getVehicleMagazines));
_count
