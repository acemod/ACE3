/*
 * Author: commy2
 * Get the nearest object the player is looking at. Used for laser designator instead of cursorTarget.
 *
 * Arguments:
 * 0: Maximum search distance <NUMBER>
 *
 * Return Value:
 * Nearest object in line of sight, objNull if none are found <OBJECT>
 *
 * Example:
 * [56] call ace_common_fnc_getTargetObject
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_maxDistance"];

private _position = ATLToASL positionCameraToWorld [0, 0, 0];
_position set [2, (_position select 2) - (getTerrainHeightASL _position min 0)];

private _laser = ATLToASL positionCameraToWorld [0, 0, _maxDistance];
_laser set [2, (_laser select 2) - (getTerrainHeightASL _laser min 0)];

private _intersects = lineIntersectsObjs [_position, _laser, objNull, objNull, true, 2];

if (_intersects isEqualTo []) exitWith {objNull};

_intersects select 0 // return
