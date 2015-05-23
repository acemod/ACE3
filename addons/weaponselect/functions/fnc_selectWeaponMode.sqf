/*
 * Author: commy2
 *
 * The player will select the specified weapon or will change to the next firing mode if the weapon was already selected.
 *
 * Argument:
 * 0: A weapon (String)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

PARAMS_2(_unit,_weapon);

if (_weapon == "") exitWith {};

if (currentWeapon _unit != _weapon) exitWith {
    _unit selectWeapon _weapon;
};

// unlock safety
if (_weapon in (_unit getVariable [QEGVAR(safemode,safedWeapons), []])) exitWith {
    [_unit, _weapon, _weapon] call EFUNC(safemode,unlockSafety);
};

private ["_muzzles", "_modes"];

_muzzles = [_weapon] call EFUNC(common,getWeaponMuzzles);
_modes = [_weapon] call EFUNC(common,getWeaponModes);

private ["_index", "_muzzle", "_mode"];

_index = (_modes find currentWeaponMode _unit) + 1;
if (_index > count _modes - 1) then {_index = 0};

_muzzle = _muzzles select 0;
_mode = _modes select _index;

_index = 0;
while {
    _index < 100 && {currentMuzzle _unit != _muzzle || {currentWeaponMode _unit != _mode}}
} do {
    _unit action ["SwitchWeapon", _unit, _unit, _index];
    _index = _index + 1;
};

// play fire mode selector sound
[_unit, _weapon] call FUNC(playChangeFiremodeSound);
