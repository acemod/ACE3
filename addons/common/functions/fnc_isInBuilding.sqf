/*
 * Author: commy2
 * Check if the unit is in a building. Will return true if the unit is sitting in a bush.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Is the unit in a building? <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define CHECK_DISTANCE 10

params ["_unit"];

private ["_position", "_intersections"];

_position = eyePos _unit;

_intersections = 0;

if (lineIntersects [_position, _position vectorAdd [0, 0, +CHECK_DISTANCE]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [+CHECK_DISTANCE, 0, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [-CHECK_DISTANCE, 0, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [0, +CHECK_DISTANCE, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [0, -CHECK_DISTANCE, 0]]) then {
  _intersections = _intersections + 1;
};

_intersections > 3
