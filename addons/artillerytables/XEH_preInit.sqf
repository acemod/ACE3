#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

DFUNC(rotateVector3d) = {
    params ["_vector", "_rotAxis", "_angle"];

    _vector params ["_x", "_y", "_z"];
    (vectorNormalized _rotAxis) params ["_u", "_v", "_w"];

    private _f = (_u*_x + _v*_y + _w*_z) * (1-cos(_angle));
    [
    _u*_f + _x*cos(_angle) + (_v*_z - _w*_y)*sin(_angle),
    _v*_f + _y*cos(_angle) + (_w*_x - _u*_z)*sin(_angle),
    _w*_f + _z*cos(_angle) + (_u*_y - _v*_x)*sin(_angle)
    ]
};

ADDON = true;
