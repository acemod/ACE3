// by commy2

private ["_unit", "_side"];

_unit = _this select 0;
_side = _this select 1;

// rallypoint names are defined in CfgVehicles.hpp

_unit getVariable ["ACE_canMoveRallypoint"), false]
&& {!isNull ([
  objNull,
  missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
  missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
  missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1)}
