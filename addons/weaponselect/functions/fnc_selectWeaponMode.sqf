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
#include "script_component.hpp"

params ["_unit", "_weapon"];

if (_weapon == "") exitWith {};

if (currentWeapon _unit != _weapon) exitWith {
    _unit selectWeapon _weapon;
};

// unlock safety
if (_weapon in (_unit getVariable [QEGVAR(safemode,safedWeapons), []])) exitWith {
    [_unit, _weapon, _weapon] call EFUNC(safemode,unlockSafety);
};

private _muzzles = [_weapon] call EFUNC(common,getWeaponMuzzles);
private _modes = [_weapon] call EFUNC(common,getWeaponModes);

private _index = (_modes find currentWeaponMode _unit) + 1;

if (_index > count _modes - 1) then {_index = 0};

private _muzzle = _muzzles select 0;
private _mode = _modes select _index;

_index = 0;

while {
    _index < 299 && {currentMuzzle _unit != _muzzle || {currentWeaponMode _unit != _mode}}
} do {
    _unit action ["SwitchWeapon", _unit, _unit, _index];
    _index = _index + 1;
};

// play fire mode selector sound
[_unit, _weapon] call FUNC(playChangeFiremodeSound);
