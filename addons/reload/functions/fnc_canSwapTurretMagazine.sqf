#include "..\script_component.hpp"
/*
 * Author: PabstMirror, johnb43
 * Check if the player can reload their vehicle's magazine to one with more ammo.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can swap turret magazine <BOOL>
 *
 * Example:
 * [vehicle player, player] call ace_reload_fnc_canSwapTurretMagazine
 *
 * Public: No
 */

params ["_vehicle", "_unit"];
TRACE_2("canSwapTurretMagazine",_vehicle,_unit);

private _turretPath = _vehicle unitTurret _unit;
if (_turretPath in [[-1], []]) exitWith {false}; // skip driver / cargo
if !(_vehicle turretLocal _turretPath) exitWith {false}; // just to be safe

(weaponState [_vehicle, _turretPath]) params ["_weapon", "_muzzle", "", "_magazine", "_ammoCount", "_roundReloadPhase", "_magazineReloadPhase"];
TRACE_5("",_weapon,_muzzle,_magazine,_ammoCount,typeOf _vehicle);

if ((_weapon == "") || {_weapon != _muzzle}) exitWith {false}; // skip multi-muzzle (he/ap auto-cannons)
if (_magazine == "") exitWith {false};
if (_roundReloadPhase + _magazineReloadPhase != 0) exitWith {false}; // can't reload while already reloading or while shooting
if (isText (configFile >> "CfgMagazines" >> _magazine >> "pylonWeapon")) exitWith {false};
if (getNumber (configFile >> "CfgWeapons" >> _weapon >> "type") % 2 == 1) exitWith {false}; // engine support for magazine swapping

private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
if ((_ammoCount == 0) || {_ammoCount == _maxAmmo}) exitWith {false};

private _magAmmoCounts = [];

// Get count of rounds in magazines
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];

    if ((_xMag == _magazine) && {_xTurret isEqualTo _turretPath}) then {
        _magAmmoCounts pushBack _xAmmo;
    };
} forEach (magazinesAllTurrets _vehicle);

TRACE_1("",_magAmmoCounts);

// Select maximum
(selectMax _magAmmoCounts) > _ammoCount
