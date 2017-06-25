/*
 * Author: Tuupertunut
 * Sets the ammo counts of all magazines of given class in turret.
 *
 * BIS command "setMagazineTurretAmmo" is broken at the time of writing (2017-06-24)
 * (https://feedback.bistudio.com/T79689). This function is intended as a workaround for it. All
 * magazines are removed and then added again with updated ammo counts.
 * Note: As an unintended side effect, the turret reloads after running this function.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magazine Classname <STRING>
 * 3: Ammo Counts in Magazines <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, [0], "200Rnd_127x99_mag_Tracer_Red", [200, 152]] call ace_rearm_fnc_setTurretMagazineAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_turretPath", [], [[]]],
    ["_magazineClass", "", [""]],
    ["_ammoCounts", [], [[]]]
];

_vehicle removeMagazinesTurret [_magazineClass, _turretPath];
{
    _vehicle addMagazineTurret [_magazineClass, _turretPath, _x];
} forEach _ammoCounts;
