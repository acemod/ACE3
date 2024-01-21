#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Return true if the position is inside the map marker (to allow dragging).
 *
 * Arguments:
 * 0: x position (in meters) <NUMBER>
 * 1: y position (in meters) <NUMBER>
 *
 * Return Value:
 * Is inside map tool <BOOL>
 *
 * Example:
 * [0, 5] call ace_maptools_fnc_isInsideMapTool
 *
 * Public: No
 */

if (GVAR(mapTool_Shown) == 0) exitWith {false};

private _textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (GVAR(mapTool_Shown) - 1);

private _relPos = _this vectorDiff GVAR(mapTool_pos);
private _dirVector = [sin GVAR(mapTool_angle), cos GVAR(mapTool_angle)];

// Projection of the relative position over the longitudinal axis of the map tool
private _lambdaLong = _dirVector vectorDotProduct _relPos;

if (_lambdaLong < DIST_BOTTOM_TO_CENTER_PERC * _textureWidth) exitWith {false};
if (_lambdaLong > DIST_TOP_TO_CENTER_PERC * _textureWidth) exitWith {false};

// Projection of the relative position over the transversal axis of the map tool
private _lambdaTransAbs = vectorMagnitude (_relPos vectorDiff (_dirVector vectorMultiply _lambdaLong));

_lambdaTransAbs <= DIST_LEFT_TO_CENTER_PERC * _textureWidth
