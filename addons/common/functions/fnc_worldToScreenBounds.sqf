/*
 * Author: zGuba 2011
 *
 * Function helper for framing objects on screen.
 *
 * Arguments:
 * 0: object <OBJECT>
 * 1: margins 3D <ARRAY>
 *   0: X <NUMBER>
 *   1: Y <NUMBER>
 *   2: Z <NUMBER>
 * 2: offset 3D <ARRAY>
 *   0: X <NUMBER>
 *   1: Y <NUMBER>
 *   2: Z <NUMBER>
 *
 * Return Value:
 * 0: Minimal X <NUMMBER>
 * 1: Minimal Y <NUMMBER>
 * 2: Maximal X <NUMMBER>
 * 3: Maximal Y <NUMMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_minX","_minY","_maxX","_maxY", "_bounds", "_boundsCorners", "_boundsMax", "_boundsMaxX", "_boundsMaxY", "_boundsMaxZ", "_boundsMin", "_boundsMinX", "_boundsMinY", "_boundsMinZ"];

params ["_object", "_margins", "_offsets"];

_minX = 10;
_minY = 10;
_maxX = -10;
_maxY = -10;

_bounds = boundingBox _object;
_margins params ["_marginsX", "_marginsY", "_marginsZ"];
_offsets params ["_offsetsX", "_offsetsY", "_offsetsZ"];

_bounds params ["_boundsMin", "_boundsMax"];
_boundsMin params ["_boundsMinX", "_boundsMinY", "_boundsMinZ"];
_boundsMax params ["_boundsMaxX", "_boundsMaxY", "_boundsMaxZ"];

_boundsMinX = _boundsMinX - _marginsX + _offsetsX;
_boundsMinY = _boundsMinY - _marginsY + _offsetsY;
_boundsMinZ = _boundsMinZ - _marginsZ + _offsetsZ;

_boundsMaxX = _boundsMaxX + _marginsX + _offsetsX;
_boundsMaxY = _boundsMaxY + _marginsY + _offsetsY;
_boundsMaxZ = _boundsMaxZ + _marginsZ + _offsetsZ;

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
        _ppos params ["_pposX", "_pposY"];
        if (_pposX < _minX) then {_minX = _pposX};
        if (_pposX > _maxX) then {_maxX = _pposX};
        if (_pposY < _minY) then {_minY = _pposY};
        if (_pposY > _maxY) then {_maxY = _pposY};
    }; //else - what to do if it is offscreen?
   true
} count _boundsCorners;

[_minX,_minY,_maxX,_maxY]
