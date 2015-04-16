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

private ["_unit", "_side", "_rallypoint", "_toBase"];

_unit = _this select 0;
_side = _this select 1;
_rallypoint = _this select 2;

// rallypoint names are defined in CfgVehicles.hpp

_toBase = _rallypoint find "_Base" != -1;

_rallypoint = missionNamespace getVariable [_rallypoint, objNull],

if (isNull _rallypoint) exitWith {};

_unit setPosASL getPosASL _rallypoint;
[[localize "STR_ACE_Respawn_TeleportedToRallypoint", localize "STR_ACE_Respawn_TeleportedToBase"] select _toBase] call EFUNC(common,displayTextStructured);
