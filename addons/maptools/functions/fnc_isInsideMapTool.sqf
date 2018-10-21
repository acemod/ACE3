#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Return true if the position is inside the map marker (to allow dragging).
 *
 * Arguments:
 * 0: x Position (in meters) <NUMBER>
 * 1: y Position (in meters) <NUMBER>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [0, 5] call ACE_maptools_fnc_isInsideMapTool
 *
 * Public: No
 */

if (GVAR(mapTool_Shown) == 0) exitWith {false};
private _textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (GVAR(mapTool_Shown) - 1);

private _pos = [_this select 0, _this select 1, 0];
private _relPos = _pos vectorDiff [GVAR(mapTool_pos) select 0, GVAR(mapTool_pos) select 1, 0];
private _dirVector = [sin(GVAR(mapTool_angle)), cos(GVAR(mapTool_angle)), 0];

// Projection of the relative position over the longitudinal axis of the map tool
private _lambdaLong = _dirVector vectorDotProduct _relPos;
if (_lambdaLong < DIST_BOTTOM_TO_CENTER_PERC * _textureWidth) exitWith {false};

// Projection of the relative position over the trasversal axis of the map tool
private _lambdaTrasAbs = vectorMagnitude (_relPos vectorDiff (_dirVector vectorMultiply _lambdaLong));
if (_lambdaLong > DIST_TOP_TO_CENTER_PERC * _textureWidth) exitWith {false};
if (_lambdaTrasAbs > DIST_LEFT_TO_CENTER_PERC * _textureWidth) exitWith {false};

true
