/*
 * Author: KoffeinFlummi, esteldunedain
 * Adjusts the flight path of the bullet according to the zeroing. Called from the unified fired EH only for local and non-local players on foot.
 *
 * Argument:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private ["_adjustment", "_weaponIndex", "_zeroing", "_adjustment"];

_adjustment = _unit getVariable [QGVAR(Adjustment), []];
if (_adjustment isEqualTo []) exitWith {};

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

_zeroing = _adjustment select _weaponIndex;

if (_zeroing isEqualTo [0, 0, 0]) exitWith {};

// Convert zeroing from mils to degrees
_zeroing = _zeroing vectorMultiply 0.05625;
_zeroing params ["_elevation", "_windage", "_zero"];

[_projectile, _windage, _elevation + _zero, 0] call EFUNC(common,changeProjectileDirection);
