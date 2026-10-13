#include "..\script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Calculates the maximum number of magazines a turret can hold according to config.
 * Vehicles with ace_rearm_scriptedLoadout use their current magazine count instead, so rearm only refills existing magazines.
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

params ["_vehicle", "_turretPath", "_magazineClass"];

// Scripted loadouts: use the magazines currently on the vehicle as the maximum, so rearm only refills existing magazines and doesn't add new ones up to the config count
if (_vehicle getVariable [QGVAR(scriptedLoadout), false]) exitWith {
    {(_x select 0) == _magazineClass && {(_x select 1) isEqualTo _turretPath}} count (magazinesAllTurrets _vehicle)
};

private _count = {_x == _magazineClass} count ([_vehicle, _turretPath] call FUNC(getTurretConfigMagazines));
_count
