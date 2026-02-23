#include "..\script_component.hpp"
/*
 * Author: commy2
 * The player will select the specified weapon and change to the first additional muzzle. E.g. the grenade launcher of a assault rifle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_weaponselect_fnc_selectWeaponMuzzle
 *
 * Public: No
 */

params ["_unit", "_weapon"];

if (_weapon == "" || {!(_unit hasWeapon _weapon)}) exitWith {};

private _muzzles = _weapon call EFUNC(common,getWeaponMuzzles);

if (count _muzzles <= 1) exitWith {};

private _index = if (currentWeapon _unit == _weapon) then {
    (((_muzzles find currentMuzzle _unit) + 1) % (count _muzzles)) max 1
} else {
    1
};

private _muzzle = _muzzles select _index;

_unit selectWeapon [_weapon, _muzzle, ([_weapon, _muzzle] call EFUNC(common,getWeaponModes)) select 0];

nil // return
