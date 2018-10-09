#include "script_component.hpp"
/*
 * Author: ACE-Team
 * ?
 *
 * Arguments:
 * <UNKNOWN>
 *
 * Return Value:
 * Something <UNKNOWN>
 *
 * Example:
 * [UNKNOWN] call ace_common_fnc_translateToModelSpace
 *
 * Public: No
 */

params ["_object", "_matrix", "_offset"];

private _origin = getPosASL _object;

_matrix params ["_xVec", "_yVec", "_zVec"];

_offset params ["_x", "_y", "_z"];

(_xVec vectorMultiply _x) vectorAdd (_yVec vectorMultiply _y) vectorAdd (_zVec vectorMultiply _z) vectorAdd _origin // return
