/*
 * Author: KoffeinFlummi, commy2
 *
 * Handles deafness due to large-caliber weapons going off near the player.
 *
 * Arguments:
 * -> FiredNear Event Handler
 *
 * Return Value:
 * none
 */

private ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_silencer", "_audibleFireCoef", "_loudness", "_strength"];

_unit = _this select 0;
_firer = _this select 1;
_distance = (_this select 2) max 1;
_weapon = _this select 3;
_muzzle = _this select 4;
_mode = _this select 5;
_ammo = _this select 6;

if (_weapon in ["Throw", "Put"]) exitWith {};
if (_unit != vehicle _unit && {!([_unit] call AGM_Core_fnc_isTurnedOut)}) exitWith {};

_silencer = switch (_weapon) do {
  case (primaryWeapon _unit) : {primaryWeaponItems _unit select 0};
  case (secondaryWeapon _unit) : {secondaryWeaponItems _unit select 0};
  case (handgunWeapon _unit) : {handgunItems _unit select 0};
  default {""};
};

_audibleFireCoef = 1;
//_audibleFireTimeCoef = 1;
if (_silencer != "") then {
  _audibleFireCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFire");
  //_audibleFireTimeCoef = getNumber (configFile >> "CfgWeapons" >> _silencer >> "ItemInfo" >> "AmmoCoef" >> "audibleFireTime");
};

_audibleFire = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
//_audibleFireTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFireTime");

_loudness = _audibleFireCoef * _audibleFire / 64;
_strength = _loudness - (_loudness/50 * _distance); // linear drop off

if (_strength < 0.01) exitWith {};

[_unit, _strength] spawn {
  sleep 0.2;
  _this call AGM_Hearing_fnc_earRinging;
};
