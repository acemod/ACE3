/*
 * Author: PabstMirror
 * Check if the player can reload their vehicles magazine to one with more ammo
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * <BOOL> 
 *
 * Example:
 * [vehicle player, player] call ace_reload_fnc_canSwapTurretMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];
TRACE_2("canSwapTurretMagazine",_vehicle,_player);

private _turretPath = _player call CBA_fnc_turretPath;
if (_turretPath isEqualTo []) exitWith {false}; // skip driver / cargo
if (!(_vehicle turretLocal _turretPath)) exitWith {false}; // just to be safe

(weaponState [_vehicle, _turretPath]) params ["_weapon", "_muzzle", "", "_magazine", "_ammoCount"];
TRACE_5("",_weapon,_muzzle,_magazine,_ammoCount,typeOf _vehicle);

if ((_weapon == "") || {_weapon != _muzzle}) exitWith {false}; // skip multi-muzzle (he/ap auto-cannons)
if (_magazine == "") exitWith {false};
if (isText (configFile >> "CfgMagazines" >> _magazine >> "pylonWeapon")) exitWith {false};

private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
if ((_ammoCount == 0) || {_ammoCount == _maxAmmo}) exitWith {false};

private _magAmmoCounts = [];
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if ((_xMag == _magazine) && {_xTurret isEqualTo _turretPath}) then {
        _magAmmoCounts pushBack _xAmmo;
    };
} forEach (magazinesAllTurrets _vehicle);

_magAmmoCounts sort false;
TRACE_1("",_magAmmoCounts);

if ((count _magAmmoCounts) < 2) exitWith {false};
if ((_magAmmoCounts select 0) <= _ammoCount) exitWith {false}; // what we have is already the best

true
