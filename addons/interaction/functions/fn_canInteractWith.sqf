// by commy2

private ["_unit", "_isCivilian"];

_unit = _this select 0;
_isCivilian = _this select 1;

if (isNil "_isCivilian") then {_isCivilian = true};

alive _unit
&& [side _unit != side AGM_player, side group _unit == civilian] select _isCivilian
//&& {count (weapons _unit) == 0}
