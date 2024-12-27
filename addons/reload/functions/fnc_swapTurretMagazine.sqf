#include "..\script_component.hpp"
/*
 * Author: PabstMirror, johnb43
 * Reloads a vehicles turret to a new magazine.
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

params ["_vehicle", "_unit"];
TRACE_2("swapTurretMagazine",_vehicle,_unit);

private _turretPath = _vehicle unitTurret _unit;
(weaponState [_vehicle, _turretPath]) params ["_weapon", "_muzzle", "", "_magazine"];
TRACE_3("",_weapon,_magazine,typeOf _vehicle);

private _magazinesAllTurrets = [];

// Get magazines that are of the correct type; Exclude empty mags
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];

    if ((_xMag == _magazine) && {_xTurret isEqualTo _turretPath} && {_xAmmo > 0}) then {
        _magazinesAllTurrets pushBack _x;
    };
} forEach (magazinesAllTurrets _vehicle);

// Get count of rounds in magazines, then select maximum
private _magAmmoCounts = _magazinesAllTurrets apply {_x select 2};
private _mag = _magazinesAllTurrets select (_magAmmoCounts find (selectMax _magAmmoCounts));

TRACE_2("",_magAmmoCounts,_mag);

_unit action ["loadMagazine", _vehicle, _unit, _mag select 4, _mag select 3, _weapon, _muzzle];
