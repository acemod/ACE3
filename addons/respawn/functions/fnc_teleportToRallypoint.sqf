/*
 * Author: commy2
 * Teleports a unit to a rallypoint
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Side <SIDE>
 * 2: Rallypoint name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, side ACE_Player, rallypoint_name] call ace_respawn_fnc_teleportToRallypoint;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_side", "_rallypoint"];

private _toBase = _rallypoint find "_Base" != -1;

_rallypoint = missionNamespace getVariable [_rallypoint, objNull];

if (isNull _rallypoint) exitWith {};

_unit setPosASL getPosASL _rallypoint;

[[localize LSTRING(TeleportedToRallypoint), localize LSTRING(TeleportedToBase)] select _toBase] call EFUNC(common,displayTextStructured);
