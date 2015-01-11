/*
 * Author: commy2
 *
 * The player will select the specified weapon and change to the first additional muzzle. E.g. the grenade launcher of a assault rifle.
 *
 * Argument:
 * 0: A weapon (String)
 *
 * Return value:
 * None.
 */

private ["_player", "_weapon", "_muzzles", "_count", "_index", "_muzzle"];

_player = _this select 0;
_weapon = _this select 1;

if (_weapon == "") exitWith {};

_muzzles = [_weapon] call AGM_WeaponSelect_fnc_getWeaponMuzzles;

if (currentWeapon _player != _weapon) exitWith {
  if (count _muzzles > 1) then {

    // unlock safety
    /*if (_weapon in (_player getVariable ["AGM_SafeMode_safedWeapons", []])) exitWith {
      [_player, _weapon, _muzzles select 1] call AGM_SafeMode_fnc_unlockSafety;
    };*/

    _player selectWeapon (_muzzles select 1);
  };
};

_count = count _muzzles;
_index = (_muzzles find currentMuzzle _player) + 1;
if (_index > _count - 1) then {_index = 1};

_muzzle = _muzzles select _index;

_index = 0;
while {
  _index < 100 && {currentMuzzle _player != _muzzle}
} do {
  _player action ["SwitchWeapon", _player, _player, _index];
  _index = _index + 1;
};
