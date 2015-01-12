// by commy2

private ["_unit", "_side", "_toBase", "_rallypoint"];

_unit = _this select 0;
_side = _this select 1;
_toBase = _this select 2;

_rallypoint = ([
  [
    objNull,
    missionNamespace getVariable ["AGM_RallypointExit_West", objNull],
    missionNamespace getVariable ["AGM_RallypointExit_East", objNull],
    missionNamespace getVariable ["AGM_RallypointExit_Independent", objNull]
  ],
  [
    objNull,
    missionNamespace getVariable ["AGM_Rallypoint_West", objNull],
    missionNamespace getVariable ["AGM_Rallypoint_East", objNull],
    missionNamespace getVariable ["AGM_Rallypoint_Independent", objNull]
  ]
] select _toBase) select ([west, east, independent] find _side) + 1;

if (isNull _rallypoint) exitWith {};

_unit setPosASL (getPosASL _rallypoint);
[["Teleported to Rallypoint", "Teleported to Base"] select _toBase] call AGM_Core_fnc_displayTextStructured;
