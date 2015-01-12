/*
  Name: ACE_Respawn_fnc_teleportToRallypoint
  
  Author(s):
    commy2
  
  Description:
    teleports a unit to a rallypoint
  
  Parameters:
    0: OBJECT - unit
    1: OBJECT - side
    2: BOOLEAN - teleport to base
  
  Returns:
    VOID
*/

#include "script_component.hpp"

private ["_unit", "_side", "_toBase", "_rallypoint"];

_unit = _this select 0;
_side = _this select 1;
_toBase = _this select 2;

// rallypoint names are defined in CfgVehicles.hpp

_rallypoint = ([
  [
    objNull,
    missionNamespace getVariable ["ACE_RallypointExit_West", objNull],
    missionNamespace getVariable ["ACE_RallypointExit_East", objNull],
    missionNamespace getVariable ["ACE_RallypointExit_Independent", objNull]
  ],
  [
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
  ]
] select _toBase) select ([west, east, independent] find _side) + 1;

if (isNull _rallypoint) exitWith {};

_unit setPosASL (getPosASL _rallypoint);
[[localize "STR_ACE_Respawn_TeleportedToRallypoint", localize "STR_ACE_Respawn_TeleportedToBase"] select _toBase] call EFUNC(Core, displayTextStructured);
