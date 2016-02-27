/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret can hold according to config.
 *
 * Arguments:
 * 0: Target <OBJECT>
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

params [["_target", objNull, [objNull]], ["_turretPath", [], [[]]]];

if (isNull _target) exitWith {[]};

([typeOf _target, _turretPath] call FUNC(getConfigMagazines))
