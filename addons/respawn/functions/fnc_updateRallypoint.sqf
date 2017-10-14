/*
 * Author: commy2
 * Updates marker position and texts.
 *
 * Arguments:
 * 0: Marker <STRING>
 * 1: Side <SIDE>
 * 2: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [marker_name, side ACE_Player, getPos ACE_Player] call ace_respawn_fnc_updateRallypoint
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_rallypoint", "_side", "_position"];

if (!hasInterface) exitWith {};

private _marker = _rallypoint getVariable [QGVAR(marker), ""];
private _markerDate = _rallypoint getVariable [QGVAR(markerDate), ""];

_marker setMarkerPosLocal _position;
_marker setMarkerTextLocal _markerDate;
