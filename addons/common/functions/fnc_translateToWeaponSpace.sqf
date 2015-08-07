/*
 * Author: ?
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Returns:
 * ?
 *
 * Public: ?
*/
#include "script_component.hpp"

private["_origin", "_out"];

params ["_object", "_matrix", "_offset"];

_origin = getPosASL _object;
_matrix params ["_xVec", "_yVec", "_zVec"];

_offset = _offset vectorDiff _origin;

_offset params ["_Offx", "_Offy", "_Offz"];

_xVec params ["_xVecx", "_xVecy", "_xVecz"];
_yVec params ["_yVecx", "_yVecy", "_yVecz"];
_zVec params ["_zVecx", "_zVecy", "_zVecz"];

_out = [
            (_xVecx * _Offx) + (_xVecy * _Offy) + (_xVecz * _Offz),
            (_yVecx * _Offx) + (_yVecy * _Offy) + (_yVecz * _Offz),
            (_zVecx * _Offx) + (_zVecy * _Offy) + (_zVecz * _Offz)
        ];

_out;
