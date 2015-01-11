// by commy2

private ["_vehicle", "_weapon", "_ammo", "_magazine", "_player"];

_vehicle = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_magazine = _this select 5;

_player = AGM_player;

if (_player != _vehicle && {!(_weapon in (_vehicle weaponsTurret ([_player] call AGM_Core_fnc_getTurretIndex)))}) exitWith {};

private ["_silencer", "_visibleFireCoef", "_visibleFireTimeCoef", "_visibleFire", "_visibleFireTime", "_nvgBrightnessCoef", "_fnc_isTracer", "_darkness"];

_silencer = switch (_weapon) do {
  case (primaryWeapon _player) : {primaryWeaponItems _player select 0};
  case (secondaryWeapon _player) : {secondaryWeaponItems _player select 0};
  case (handgunWeapon _player) : {handgunItems _player select 0};
  default {""};
};

_visibleFireCoef = 1;
_visibleFireTimeCoef = 1;
if (_silencer != "") then {
  _visibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFire");
  _visibleFireTimeCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "visibleFireTime");
};

_visibleFire = getNumber (configFile >> "CfgAmmo" >> _ammo >> "visibleFire");
_visibleFireTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "visibleFireTime");

_nvgBrightnessCoef = 1 + (_player getVariable ["AGM_NVGBrightness", 0]) / 4;

_fnc_isTracer = {
  private ["_indexShot", "_lastRoundsTracer", "_tracersEvery"];

  if (getNumber (configFile >> "CfgAmmo" >> _ammo >> "nvgOnly") > 0) exitWith {false};

  _indexShot = (_player ammo _weapon) + 1;

  _lastRoundsTracer = getNumber (configFile >> "CfgMagazines" >> _magazine >> "lastRoundsTracer");
  if (_indexShot <= _lastRoundsTracer) exitWith {true};

  _tracersEvery = getNumber (configFile >> "CfgMagazines" >> _magazine >> "tracersEvery");
  if (_tracersEvery == 0) exitWith {false};

  (_indexShot - _lastRoundsTracer) % _tracersEvery == 0
};

if (call _fnc_isTracer) then {
  _visibleFire = _visibleFire + 2;
  _visibleFireTime = _visibleFireTime + 2;
};

_darkness = 1 - (call AGM_Core_fnc_ambientBrightness);

_visibleFire = _darkness * _visibleFireCoef * _visibleFire * _nvgBrightnessCoef / 10 min 1;
_visibleFireTime = _darkness * _visibleFireTimeCoef * _visibleFireTime * _nvgBrightnessCoef / 10 min 0.5;

["NightVision", [_visibleFire, _visibleFireTime], {format ["visibleFire: %1 - visibleFireTime: %2", _this select 0, _this select 1]}] call AGM_Debug_fnc_log;

AGM_NightVision_ppEffectMuzzleFlash ppEffectAdjust [1, 1, _visibleFire, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
AGM_NightVision_ppEffectMuzzleFlash ppEffectCommit 0;

AGM_NightVision_ppEffectMuzzleFlash ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
AGM_NightVision_ppEffectMuzzleFlash ppEffectCommit _visibleFireTime;
