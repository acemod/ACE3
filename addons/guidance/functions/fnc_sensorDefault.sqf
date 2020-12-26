#include "script_component.hpp"

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];

private _potentialTargets = nearestObjects [ASLToAGL _pos, ["Car", "Tank"], _range];

private _anglesTo = [];

{
    private _vectorTo = _pos vectorFromTo (_x modelToWorldVisualWorld [0, 0, 0]);
    private _angleDif = acos (_sensorLookVector vectorDotProduct _vectorTo);
    _anglesTo pushBack _angleDif;
} forEach _potentialTargets;

_anglesTo sort true;

if ( (count _anglesTo < 1) || {((_anglesTo select 0) > _sensorLookAngle)} ) exitWith {
    [[0, 0, 0],[0, 0, 0]];
};

private _angle = (_anglesTo select 0) + 0.15;
private _targetIndex = -1;
{
    private _vectorTo = _pos vectorFromTo (_x modelToWorldVisualWorld [0, 0, 0]);
    private _angleDif = acos (_sensorLookVector vectorDotProduct _vectorTo);
    if (_angleDif <= _angle) exitWith {
        _targetIndex = _forEachIndex;
    };
} forEach _potentialTargets;

if (_targetIndex == -1) exitWith {
    [[0, 0, 0],[0, 0, 0]];
};

private _target = _potentialTargets select _targetIndex;

private _targetPos = _target modelToWorldVisualWorld [0, 0, 0];
private _returnVector = _pos vectorFromTo _targetPos;

[_returnVector, _targetPos];