#include "..\script_component.hpp"
/*
 * Author: esteldunedain, phyma
 * Check if the target has an MG equipped with belt system that a unit can link.
 *
 * Arguments:
 * 0: Unit wanting to link the belt <OBJECT>
 * 1: Unit equipped with the weapon <OBJECT>
 *
 * Return Value:
 * Maximum ammo of magazine (-1 on error) <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_reload_fnc_getAmmoToLinkBelt;
 *
 * Public: No
 */

params ["_unit", "_target"];

if !(isNull objectParent _target) exitWith {-1};

private _magazine = currentMagazine _target;
private _magazineCfg = configFile >> "CfgMagazines" >> _magazine;

if (getNumber (_magazineCfg >> "ACE_isBelt") == 0) exitWith {-1};

// Check if the ammo is not empty or full
private _ammoCount = _target ammo currentWeapon _target;

// Exit if the belt is full or empty
if (_ammoCount == 0 || {getNumber (_magazineCfg >> "count") - _ammoCount == 0}) exitWith {-1};

// Check if the unit has any of the same magazines and calculate max ammo
private _maxAmmo = 0;

{
    _maxAmmo = _maxAmmo max (_x select 1);
} forEach (magazinesAmmo _unit select {(_x select 0) == _magazine});

_maxAmmo
