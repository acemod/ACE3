#include "..\script_component.hpp"
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

params ["_maxDistance"];

private _position = AGLToASL positionCameraToWorld [0, 0, 0];

private _laser = AGLToASL positionCameraToWorld [0, 0, _maxDistance];

private _intersects = lineIntersectsObjs [_position, _laser, objNull, objNull, true, 2];

if (_intersects isEqualTo []) exitWith {objNull};

_intersects select 0 // return
