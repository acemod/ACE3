// (c) zGuba 2011
// Function helper for framing objects on screen.
// Input: [_object,_margins3D,_offset3D] (object, 3 * float array, 3 * float array)
// Output: [_minX,_minY,_minY,_maxY] (4 * float)

#include "script_component.hpp"

private ["_minX","_minY","_maxX","_maxY"];

PARAMS_3(_object,_margins,_offsets);

_minX = 10;
_minY = 10;
_maxX = -10;
_maxY = -10;

if (true) then {
    _bounds = boundingBox _object;

    _boundsMin = _bounds select 0;
    _boundsMinX = (_boundsMin select 0) - (_margins select 0) + (_offsets select 0);
    _boundsMinY = (_boundsMin select 1) - (_margins select 1) + (_offsets select 1);
    _boundsMinZ = (_boundsMin select 2) - (_margins select 2) + (_offsets select 2);
    _boundsMax = _bounds select 1;
    _boundsMaxX = (_boundsMax select 0) + (_margins select 0) + (_offsets select 0);
    _boundsMaxY = (_boundsMax select 1) + (_margins select 1) + (_offsets select 1);
    _boundsMaxZ = (_boundsMax select 2) + (_margins select 2) + (_offsets select 2);

    _boundsCorners = [
        [_boundsMinX,_boundsMinY,_boundsMinZ],
        [_boundsMinX,_boundsMinY,_boundsMaxZ],
        [_boundsMinX,_boundsMaxY,_boundsMinZ],
        [_boundsMinX,_boundsMaxY,_boundsMaxZ],
        [_boundsMaxX,_boundsMinY,_boundsMinZ],
        [_boundsMaxX,_boundsMinY,_boundsMaxZ],
        [_boundsMaxX,_boundsMaxY,_boundsMinZ],
        [_boundsMaxX,_boundsMaxY,_boundsMaxZ]
    ];


    {
        _ppos = worldToScreen (_object modelToWorld _x);
        if (count _ppos >= 2) then {
            EXPLODE_2_PVT(_ppos,_pposX,_pposY);
            if (_pposX < _minX) then {_minX = _pposX};
            if (_pposX > _maxX) then {_maxX = _pposX};
            if (_pposY < _minY) then {_minY = _pposY};
            if (_pposY > _maxY) then {_maxY = _pposY};
        }; //else - what to do if it is offscreen?
    } forEach _boundsCorners;
};

[_minX,_minY,_maxX,_maxY]
