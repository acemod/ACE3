#include "..\script_component.hpp"
/*
 * Author: commy2
 * The player will select the specified weapon or will change to the next firing mode if the weapon was already selected.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_weaponselect_fnc_selectWeaponMode
 *
 * Public: No
 */

params ["_unit", "_weapon"];

if (_weapon == "" || {!(_unit hasWeapon _weapon)}) exitWith {};

private _currentWeaponMode = (_unit weaponState _weapon) select 2;
private _muzzle = (_weapon call EFUNC(common,getWeaponMuzzles)) select 0;

if (currentWeapon _unit != _weapon) exitWith {
    _unit selectWeapon [_weapon, _muzzle, _currentWeaponMode];
};

// Unlock safety
if (_weapon in (_unit getVariable [QEGVAR(safemode,safedWeapons), []])) exitWith {
    [_unit, _weapon, _weapon] call EFUNC(safemode,unlockSafety);
};

private _modes = _weapon call EFUNC(common,getWeaponModes);

_unit selectWeapon [_weapon, _muzzle, _modes select (((_modes find _currentWeaponMode) + 1) % (count _modes))];

// Play fire mode selector sound
[_unit, _weapon] call FUNC(playChangeFiremodeSound);
