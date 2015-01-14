/*
  Name: ACE_Respawn_fnc_canMoveRallypoint
  
  Author(s):
    commy2
  
  Description:
    checks if a unit can move a rally point
  
  Parameters:
    0: OBJECT - unit
    1: OBJECT - side
  
  Returns:
    BOOLEAN
*/

#include "script_component.hpp"

private ["_unit", "_side"];

_unit = _this select 0;
_side = _this select 1;

// rallypoint names are defined in CfgVehicles.hpp

_unit getVariable ["ACE_canMoveRallypoint", false]
&& {!isNull ([
    objNull,
    missionNamespace getVariable ["ACE_Rallypoint_West", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_East", objNull],
    missionNamespace getVariable ["ACE_Rallypoint_Independent", objNull]
] select ([west, east, independent] find _side) + 1)}
