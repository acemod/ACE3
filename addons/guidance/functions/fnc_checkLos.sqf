#include "script_component.hpp"


params ["_startPos", "_targetObject", "_ignoreObject", "_forLaser"];

if (isNil "_ignoreObject") then {_ignoreObject = objNull};
if (isNil "_forLaser") then {_forLaser = false};

private _boundingBox = boundingBoxReal _targetObject;
_boundingBox params ["_minimums", "_maximums", "_circle"];
_minimums params ["_minX", "_minY", "_minZ"];
_maximums params ["_maxX", "_maxY", "_maxZ"];

private _pointsList = [[_minX, _minY, _minZ],[_minX, _minY, _maxZ],[_minX, _maxY, _minZ],[_minX, _maxY, _maxZ],[_maxX, _minY, _minZ],[_maxX, _minY, _maxZ],[_maxX, _maxY, _minZ],[_maxX, _maxY, _maxZ]];
private _LOD = "VIEW";

private _visibility = 0; 
{
    private _result = [_targetObject, _LOD, _ignoreObject] checkVisibility [_startPos, _targetObject modelToWorldVisualWorld _x];
    _visibility = _visibility + _result;
} forEach _pointsList;

_visibility = _visibility / 8;

_visibility > ([0.35, 0.8] select _forLaser)
