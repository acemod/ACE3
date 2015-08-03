/*
 * Author: commy2
 *
 * Check if the unit is in a building. Will return true if the unit is sitting in a bush.
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Is the unit in a building? (Bool)
 */
#include "script_component.hpp"

#define DISTANCE 10

private ["_position", "_positionX", "_positionY", "_positionZ", "_intersections"];

params ["_unit"];

_position = eyePos _unit;
_position params ["_positionX", "_positionY", "_positionZ"];
_intersections = 0;

if (lineIntersects [_position, [_positionX, _positionY, _positionZ + DISTANCE]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX + DISTANCE, _positionY, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX - DISTANCE, _positionY, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX, _positionY + DISTANCE, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX, _positionY - DISTANCE, _positionZ]]) then {
  _intersections = _intersections + 1;
};

_intersections > 3
