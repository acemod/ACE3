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

private ["_player", "_weapon", "_muzzles", "_modes", "_count", "_index", "_muzzle", "_mode"];

_player = _this select 0;
_weapon = _this select 1;

if (_weapon == "") exitWith {};

if (currentWeapon _player != _weapon) exitWith {
  _player selectWeapon _weapon;
};

// unlock safety
if (_weapon in (_player getVariable ["AGM_SafeMode_safedWeapons", []])) exitWith {
  [_player, _weapon, _weapon] call AGM_SafeMode_fnc_unlockSafety;
};

_muzzles = [_weapon] call AGM_WeaponSelect_fnc_getWeaponMuzzles;
_modes = [_weapon] call AGM_WeaponSelect_fnc_getWeaponModes;

_count = count _modes;
_index = (_modes find currentWeaponMode _player) + 1;
if (_index > _count - 1) then {_index = 0};

_muzzle = _muzzles select 0;
_mode = _modes select _index;

_index = 0;
while {
  _index < 100 && {currentMuzzle _player != _muzzle || {currentWeaponMode _player != _mode}}
} do {
  _player action ["SwitchWeapon", _player, _player, _index];
  _index = _index + 1;
};

// play fire mode selector sound
[_player, _weapon] call AGM_WeaponSelect_fnc_playChangeFiremodeSound;
