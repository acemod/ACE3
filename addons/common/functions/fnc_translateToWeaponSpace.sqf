#include "script_component.hpp"

private["_matrix", "_object", "_offset", "_origin", "_out", "_xVec", "_y", "_yVec", "_z", "_zVec"];

_object = _this select 0;
_origin = getPosASL _object;
_matrix = _this select 1;
_xVec = _matrix select 0;
_yVec = _matrix select 1;
_zVec = _matrix select 2;

_offset = _this select 2;

_offset = _offset vectorDiff _origin;

_x = _offset select 0;
_y = _offset select 1;
_z = _offset select 2;

_out = [
            ((_xVec select 0)*_x) + ((_xVec select 1)*_y) + ((_xVec select 2)*_z),
            ((_yVec select 0)*_x) + ((_yVec select 1)*_y) + ((_yVec select 2)*_z),
            ((_zVec select 0)*_x) + ((_zVec select 1)*_y) + ((_zVec select 2)*_z)
        ];

_out;