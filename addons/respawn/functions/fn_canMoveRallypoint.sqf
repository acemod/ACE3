// by commy2

private ["_unit", "_side"];

_unit = _this select 0;
_side = _this select 1;

_unit getVariable ["AGM_canMoveRallypoint", false]
&& {!isNull ([
  objNull,
  missionNamespace getVariable ["AGM_Rallypoint_West", objNull],
  missionNamespace getVariable ["AGM_Rallypoint_East", objNull],
  missionNamespace getVariable ["AGM_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1)}
