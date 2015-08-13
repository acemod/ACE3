/*
 * Author: ?
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
*/
#include "script_component.hpp"

private["_origin", "_out"];

params ["_object", "_matrix", "_offset"];

_origin = getPosASL _object;
_matrix params ["_xVec", "_yVec", "_zVec"];
_offset params ["_x", "_y", "_z"];

_out = (((_xVec vectorMultiply _x) vectorAdd (_yVec vectorMultiply _y)) vectorAdd (_zVec vectorMultiply _z)) vectorAdd _origin;

_out;
