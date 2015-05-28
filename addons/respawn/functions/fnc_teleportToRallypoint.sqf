/*
 * Author: commy2
 * teleports a unit to a rallypoint
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: side? <OBJECT>
 * 2: teleport to base <BOOLEAN>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [,,] call ACE_Respawn_fnc_teleportToRallypoint;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_unit,_side,_rallypoint);

private ["_toBase"];

// rallypoint names are defined in CfgVehicles.hpp

//IGNORE_PRIVATE_WARNING("_Base")
_toBase = _rallypoint find "_Base" != -1;

_rallypoint = missionNamespace getVariable [_rallypoint, objNull],

if (isNull _rallypoint) exitWith {};

_unit setPosASL getPosASL _rallypoint;
[[localize LSTRING(TeleportedToRallypoint), localize LSTRING(TeleportedToBase)] select _toBase] call EFUNC(common,displayTextStructured);
