//
#include "script_component.hpp"

private["_matrix", "_object", "_offset", "_origin", "_out", "_xVec", "_y", "_yVec", "_z", "_zVec"];

_object = _this select 0;
_origin = getPosASL _object;
_matrix = _this select 1;
_xVec = _matrix select 0;
_yVec = _matrix select 1;
_zVec = _matrix select 2;

_offset = _this select 2;

_x = _offset select 0;
_y = _offset select 1;
_z = _offset select 2;

_out = (((_xVec vectorMultiply _x) vectorAdd (_yVec vectorMultiply _y)) vectorAdd (_zVec vectorMultiply _z)) vectorAdd _origin;

_out;