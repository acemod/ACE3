/*
 * Author: commy2
 *
 * Get the nearest object the player is looking at. Used for laser designator instead of cursorTarget.
 *
 * Arguments:
 * 0: Maximal distance to search. <NUMBER>
 *
 * Return Value:
 * Nearest object directly in line of sight, if none objNull <OBJECT>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_position", "_laser", "_intersects"];

params ["_maxDistance"];

_position = ATLToASL positionCameraToWorld [0, 0, 0];
_position set [2, (_position select 2) - (getTerrainHeightASL _position min 0)];

_laser = ATLToASL positionCameraToWorld [0, 0, _maxDistance];
_laser set [2, (_laser select 2) - (getTerrainHeightASL _laser min 0)];

_intersects = lineIntersectsObjs [_position, _laser, objNull, objNull, true, 2];

if (count _intersects == 0) then {objNull} else {_intersects select 0}
