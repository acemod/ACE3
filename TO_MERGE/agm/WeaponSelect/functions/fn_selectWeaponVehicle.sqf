// by commy2

private ["_player", "_vehicle", "_index", "_turret", "_weapons", "_weapon"];

_player = _this select 0;
_vehicle = _this select 1;
_index = _this select 2;

_turret = [_player] call AGM_Core_fnc_getTurretIndex;

if (_turret isEqualTo [] && {_player == driver _vehicle}) then {
  _weapons = weapons _vehicle;
  if (_index > count _weapons - 1) exitWith {};

  _weapon = _weapons select _index;

  _index = 0;
  while {
    _index < 100 && {currentWeapon _vehicle != _weapon}
  } do {
    _player action ["SwitchWeapon", _vehicle, _player, _index];
    _index = _index + 1;
  };
} else {
  _weapons = _vehicle weaponsTurret _turret;
  if (_index > count _weapons - 1) exitWith {};

  _weapon = _weapons select _index;

  _index = 0;
  while {
    _index < 100 && {_vehicle currentWeaponTurret _turret != _weapon}
  } do {
    _player action ["SwitchWeapon", _vehicle, _player, _index];
    _index = _index + 1;
  };
};
