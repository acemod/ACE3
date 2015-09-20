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

params ["_object", "_matrix", "_offset"];

private "_origin";
_origin = getPosASL _object;

_matrix params ["_xVec", "_yVec", "_zVec"];

_offset params ["_x", "_y", "_z"];

(_xVec vectorMultiply _x) vectorAdd (_yVec vectorMultiply _y) vectorAdd (_zVec vectorMultiply _z) vectorAdd _origin // return
