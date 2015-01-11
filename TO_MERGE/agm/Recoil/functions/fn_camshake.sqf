// TMR: Small Arms - Recoil initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.
// Edited prefixes for compatability in AGM_Realism by KoffeinFlummi
// Edited by commy2

#define BASE_POWER 0.40
#define BASE_TIME 0.19
#define BASE_FREQ 13
#define RECOIL_COEF 40

private ["_unit", "_weapon", "_muzzle", "_ammo"];

_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_ammo = _this select 4;

if (_weapon in [handgunWeapon _unit, "Throw", "Put"]) exitWith {};

private ["_powerMod", "_timeMod", "_freqMod", "_powerCoef"];

_powerMod = ([0, -0.1, -0.1, 0, -0.2] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find stance _unit)) + ([0, -1, 0, -1] select (["INTERNAL", "EXTERNAL", "GUNNER", "GROUP"] find cameraView));
_timeMod = 0;
_freqMod = 0;

_powerCoef = 0;
if (_unit != vehicle _unit) then {
  _powerCoef = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_Recoil_shakeMultiplier");
  _powerCoef = _powerCoef * getNumber (configFile >> "CfgAmmo" >> _ammo >> "AGM_Recoil_shakeMultiplier");
} else {
  private ["_type", "_config", "_recoil"];

  _type = ["recoil", "recoilProne"] select (stance _unit == "PRONE");

  _config = configFile >> "CfgWeapons" >> _weapon;
  _recoil = if (_muzzle == _weapon) then {
    getText (_config >> _type)
  } else {
    getText (_config >> _muzzle >> _type)
  };

  _recoil = getArray (configFile >> "CfgRecoils" >> _recoil);
  if (count _recoil < 2) exitWith {};

  _powerCoef = _recoil select 1;
  _powerCoef = (call compile format ["%1", _powerCoef]) * RECOIL_COEF;
};

if (_unit getVariable ["AGM_weaponRested", false]) then {_powerMod = _powerMod - 0.07};
if (_unit getVariable ["AGM_bipodDeployed", false]) then {_powerMod = _powerMod - 0.11};

private "_camshake";
_camshake = [
  _powerCoef * (BASE_POWER + _powerMod) max 0,
  BASE_TIME + _timeMod max 0,
  BASE_FREQ + _freqMod max 0
];

["CamShake", _camshake, {copyToClipboard format ["addCamShake %1;", _this]; _this}] call AGM_Debug_fnc_log;

addCamShake _camshake;
