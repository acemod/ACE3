/*
 * Author: CAA-Picard
 *
 * Return true if the position is inside the map marker (to allow dragging).
 *
 * Argument:
 * 0: x Position (in meters)
 * 1: y Position (in meters)
 *
 * Return value:
 * Boolean
 */

#define TEXTURE_WIDTH_IN_M           6205
#define DIST_BOTTOM_TO_CENTER_PERC  -0.33
#define DIST_TOP_TO_CENTER_PERC      0.65
#define DIST_LEFT_TO_CENTER_PERC     0.30

if (AGM_Map_mapToolsShown == 0) exitWith {false};
_textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (AGM_Map_mapToolsShown - 1);

_pos = [_this select 0, _this select 1, 0];
_relPos = _pos vectorDiff [AGM_Map_pos select 0, AGM_Map_pos select 1, 0];
_dirVector = [sin(AGM_Map_angle), cos(AGM_Map_angle), 0];

// Projection of the relative position over the longitudinal axis of the map tool
_lambdaLong = _dirVector vectorDotProduct _relPos;
if (_lambdaLong < DIST_BOTTOM_TO_CENTER_PERC * _textureWidth) exitWith {false};

// Projection of the relative position over the trasversal axis of the map tool
_lambdaTrasAbs = vectorMagnitude (_relPos vectorDiff (_dirVector vectorMultiply _lambdaLong));
if (_lambdaLong > DIST_TOP_TO_CENTER_PERC * _textureWidth) exitWith {false};
if (_lambdaTrasAbs > DIST_LEFT_TO_CENTER_PERC * _textureWidth) exitWith {false};

true
