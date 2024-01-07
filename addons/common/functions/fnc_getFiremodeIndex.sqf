#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Get the firemode index of the weapon for use with "SwitchWeapon"
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Muzzle <STRING> (default: current weapon muzzle)
 * 2: Firemode <STRING> (default: current weapon fire mode)
 *
 * Return Value:
 * Weapon/Mode index <NUMBER>
 *
 * Example:
 * [player] call ace_common_fnc_getFiremodeIndex
 *
 * Public: Yes
 */

params ["_unit"];
(weaponState _unit) params ["", "_currentMuzzle", "_currentFiremode"];
params ["", ["_muzzle", _currentMuzzle], ["_firemode", _currentFireMode]];

private _weapons = _unit weaponsInfo [_muzzle, false];
private _index = -1;
{
    _x params ["_xIndex", "", "", "", "_xFiremode"];
    if (_xFiremode == _firemode) exitWith { _index = _xIndex; };
} forEach _weapons;

_index
