#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Text statement for the magazine ammo muzzle velocity stat.
 *
 * Arguments:
 * 0: Stats <ARRAY> (unused)
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Display text <STRING>
 *
 * Public: No
*/

params ["_stats", "_configMagazine"];

private _magClass = configName _configMagazine;
private _weapons = [primaryWeapon EGVAR(arsenal,center), handgunWeapon EGVAR(arsenal,center)];
private _weaponIndex = _weapons findIf {_x canAdd [_magClass, _x]};

// Defer to weapon stat if mag fits in the primary muzzle of an equipped weapon (except launchers)
if (_weaponIndex != -1) exitWith {
    [_stats, configFile >> "CfgWeapons" >> _weapons select _weaponIndex, _configMagazine] call FUNC(statTextStatement_weaponMuzzleVelocity);
};

private _muzzleVelocity = getNumber (_configMagazine >> "initSpeed");

format ["%1 m/s (%2 ft/s)", _muzzleVelocity toFixed 0, (_muzzleVelocity * METERS_TO_FEET_MULT) toFixed 0]
