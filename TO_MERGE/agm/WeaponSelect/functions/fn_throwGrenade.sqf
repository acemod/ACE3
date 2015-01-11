// by commy2

private ["_unit", "_weapon", "_magazine"];

_unit = _this select 0;
_weapon = _this select 1;
_magazine = _this select 5;

if (_weapon != "Throw") exitWith {};

private "_count";
_count = {_x == _magazine} count magazines _unit;

[_magazine, _count] call AGM_WeaponSelect_fnc_displayGrenadeTypeAndNumber;

if (_count == 0) then {
  if (AGM_WeaponSelect_CurrentGrenadeMuzzleIsFrag) then {AGM_WeaponSelect_CurrentGrenadeMuzzleFrag = ""} else {AGM_WeaponSelect_CurrentGrenadeMuzzleOther = ""};
  [uiNamespace getVariable "AGM_dlgSoldier", false] call AGM_WeaponSelect_fnc_toggleGrenadeCount;
};
