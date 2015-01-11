/*
 * Author: KoffeinFlummi
 *
 * Adjusts the flight path of the bullet according to the zeroing
 *
 * Arguments:
 * Fired EH
 *
 * Return Value:
 * None
 */

private ["_unit", "_weaponType", "_ammoType", "_magazineType", "_round", "_weapons", "_zeroing", "_direction", "_azimuth", "_altitude", "_velocity"];

_unit = _this select 0;
_weaponType = _this select 1;
_ammoType = _this select 4;
_round = _this select 5;
_magazineType = _this select 6;

_weapons = [
  primaryWeapon _unit,
  secondaryWeapon _unit,
  handgunWeapon _unit
];
if !(_weaponType in _weapons) exitWith {};

_zeroing = AGM_Scopes_Adjustment select (_weapons find _weaponType);

// convert zeroing from mils to degrees
_zeroing = [_zeroing, {_this * 0.05625}] call AGM_Core_fnc_map;

[_round, _zeroing select 0, _zeroing select 1, 0] call AGM_Core_fnc_changeProjectileDirection;
