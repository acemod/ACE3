// by commy2

private ["_vehicle", "_part"];

_vehicle = _this select 0;
_part = _this select 1;

("ToolKit" in items player || {!isNull ([_vehicle] call AGM_Repair_fnc_getNearestRepairer)})
&& {alive _vehicle}
&& {speed _vehicle == 0}
&& {floor (3 * (_vehicle getHitPointDamage _part)) > 0}
