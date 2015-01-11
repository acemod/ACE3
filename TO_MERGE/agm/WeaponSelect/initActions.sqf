// by commy2

private ["_unit", "_id"];

_unit = _this select 0;

/*_id = [
  _unit,
  format ["<t color=""#FFFFFF"" >%1</t>", localize "STR_AGM_WeaponSelect_ReadyGrenade"],
  "Throw",
  AGM_WeaponSelect_fnc_actionThrowCondition,
  AGM_WeaponSelect_fnc_actionThrow,
  {true},
  {[_this select 1] call AGM_WeaponSelect_fnc_selectGrenadeAll},
  2
] call AGM_Core_fnc_addActionMenuEventHandler;*/

_id = [
  _unit,
  "Throw",
  AGM_WeaponSelect_fnc_actionThrowCondition,
  AGM_WeaponSelect_fnc_actionThrow
] call AGM_Core_fnc_addActionEventHandler;

_unit setVariable ["AGM_WeaponSelect_ThrowActionID", _id];
