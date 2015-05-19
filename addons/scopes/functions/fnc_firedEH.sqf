/*
 * Author: KoffeinFlummi and esteldunedain
 * Adjusts the flight path of the bullet according to the zeroing
 *
 * Argument:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_adjustment", "_projectile", "_weaponIndex", "_zeroing", "_adjustment"];
_unit = _this select 0;
_projectile = _this select 6;

if !([_unit] call EFUNC(common,isPlayer)) exitWith {};

_adjustment = _unit getVariable [QGVAR(Adjustment), []];
if (_adjustment isEqualTo []) exitWith {};

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

_zeroing = _adjustment select _weaponIndex;

if (_zeroing isEqualTo [0,0,0]) exitWith {};

// Convert zeroing from mils to degrees
_zeroing = _zeroing vectorMultiply 0.05625;

[_projectile, (_zeroing select 1), (_zeroing select 0) + (_zeroing select 2), 0] call EFUNC(common,changeProjectileDirection);
