/*
 * Author: PabstMirror
 * Check if the player can 
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player] call ace_reload_fnc_swapTurretMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_player"];
TRACE_2("swapTurretMagazine",_vehicle,_player);

private _turretPath = _player call CBA_fnc_turretPath;
(weaponState [_vehicle, _turretPath]) params ["_weapon", "", "", "_magazine"];
TRACE_3("",_weapon,_magazine,typeOf _vehicle);

private _weaponMagazines = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")) apply {toLower _x};

private _magAmmoCounts = [];  // ammo counts for the magazine type currently loaded
private _otherMagazines = []; // mag type and ammo count for magazines that also fit into the weapon
private _magazinesToRemove = [_magazine];
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if ((_xTurret isEqualTo _turretPath) && {_xAmmo > 0}) then {
        if (_xMag == _magazine) then {
            _magAmmoCounts pushBack _xAmmo;
        } else {
            if ((toLower _xMag) in _weaponMagazines) then {
                _magazinesToRemove pushBackUnique _xMag;
                _otherMagazines pushBack [_xMag, _xTurret, _xAmmo];
            };
        };
    };
} forEach (magazinesAllTurrets _vehicle);

TRACE_1("Remove all magazines that could fit into the current weapon",_magazinesToRemove);
{  
    _vehicle removeMagazinesTurret [_x, _turretPath];
} forEach _magazinesToRemove;

_magAmmoCounts sort false; // sort mags in decending order

TRACE_2("Re-add the previously loaded magazines",_magazine,_magAmmoCounts);
{
    _vehicle addMagazineTurret [_magazine, _turretPath, _x];
} forEach _magAmmoCounts;

TRACE_1("Re-add other magazines",_otherMagazines);
{
    _vehicle addMagazineTurret _x;
} forEach _otherMagazines;

TRACE_1("done",weaponState [ARR_2(_vehicle, _turretPath)]);

nil
