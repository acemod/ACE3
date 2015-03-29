/*
 * Author: KoffeinFlummi and esteldunedain
 * Adjusts the flight path of the bullet according to the zeroing
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 3: Muzzle <STRING>
 * 4: Magazine <STRING>
 * 5: Ammo <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_adjustment", "_weapon", "_projectile", "_weaponIndex", "_zeroing", "_adjustment"];

_unit = _this select 0;

// Exit if the unit doesn't have any adjusment variable
_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") exitWith {};

// Exit if the unit isn't a player
if !([_unit] call EFUNC(common,isPlayer)) exitWith {};

_weapon = _this select 1;
_projectile = _this select 5;

_weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

_zeroing = _adjustment select _weaponIndex;

// Convert zeroing from mils to degrees
_zeroing = [_zeroing, {_this * 0.05625}] call EFUNC(common,map);

[_projectile, _zeroing select 0, _zeroing select 1, 0] call EFUNC(common,changeProjectileDirection);
