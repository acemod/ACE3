/*
 * Author: Tuupertunut
 * Returns the current ammo counts in all magazines of given class in turret.
 *
 * BIS command "magazineTurretAmmo" is broken at the time of writing (2017-06-24)
 * (https://feedback.bistudio.com/T79689). This function is intended as a workaround for it,
 * extracting the data from the array returned by "magazinesAllTurrets".
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magazine Classname <STRING>
 *
 * Return Value:
 * Current ammo counts in magazines. <ARRAY of NUMBERs>
 *
 * Example:
 * [vehicle, [0], "200Rnd_127x99_mag_Tracer_Red"] call ace_rearm_fnc_getTurretMagazineAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turretPath", "_magazineClass"];

private _ammo = magazinesAllTurrets _vehicle select {(_x select 0) isEqualTo _magazineClass && {(_x select 1) isEqualTo _turretPath}} apply {_x select 2};
_ammo
