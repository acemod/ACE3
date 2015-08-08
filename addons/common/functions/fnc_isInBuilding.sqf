/*
 * Author: commy2
 *
 * Check if the unit is in a building. Will return true if the unit is sitting in a bush.
 *
 * Arguments:
 * 0: Unit (OBJECT)
 *
 * Return value:
 * Is the unit in a building? (BOOLEAN)
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define dDISTANCE 10

private ["_position", "_positionX", "_positionY", "_positionZ", "_intersections"];

params ["_unit"];

_position = eyePos _unit;
_position params ["_positionX", "_positionY", "_positionZ"];
_intersections = 0;

if (lineIntersects [_position, [_positionX, _positionY, _positionZ + dDISTANCE]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX + dDISTANCE, _positionY, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX - dDISTANCE, _positionY, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX, _positionY + dDISTANCE, _positionZ]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, [_positionX, _positionY - dDISTANCE, _positionZ]]) then {
  _intersections = _intersections + 1;
};

_intersections > 3
