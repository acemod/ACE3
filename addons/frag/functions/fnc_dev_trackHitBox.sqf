#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add a hit box outline to an object.
 *
 * Arguments:
 * 0: Object that should have it's hit box drawn <OBJECT> (default: objNull)
 * 1: Add sphere at object origin <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_frag_fnc_dev_trackHitBox
 *
 * Public: No
 */

params [
    ["_object", objNull],
    ["_addSphere", true]
];
TRACE_2("Adding hitbox",_object,_addSphere);

if (isNull _object) exitWith {};

// Grab the right hitBox
private _boundingBox = [];
if (_object isKindOf "CAManBase") then {
    if (isNull objectParent _object) then {
        _boundingBox = 0 boundingBox _object;
    } else {
        _boundingBox = boundingBoxReal [_object, "Geometry"];
    };
} else {
    _boundingBox = boundingBoxReal [_object, "FireGeometry"];
};
_boundingBox params ["_lowerPoint", "_upperPoint"];

// adjust with stance
switch (stance _object) do {
    case "STAND": {_upperPoint set [2, 1.9];};
    case "CROUCH": {_upperPoint set [2, 1.3];};
    case "PRONE": {_upperPoint set [2, 0.8];};
};
private _centerPoint = ASLToAGL getPosASL _object;

if (GVAR(dbgSphere) && _addSphere && {isNull objectParent _object}) then {
    private _centerSphere = [getPosASL _object, "yellow"] call FUNC(dev_sphereDraw);
    _centerSphere attachTo [_object, _object worldToModel _centerPoint];
};

// create an optimized outline
_upperPoint params ["_x1","_y1","_z1"];
_lowerPoint params ["_x2","_y2","_z2"];
private _points = [
    _upperPoint,
    [_x1, _y2, _z1],
    [_x2, _y2, _z1],
    [_x2, _y1, _z1],
    [_x1, _y1, _z2],
    [_x1, _y2, _z2],
    _lowerPoint,
    [_x2, _y1, _z2]
];

private _color = switch (side _object) do {
    case east: {[0.8, 0, 0, 1]};
    case resistance: {[0, 0.8, 0, 1]};
    default {[0, 0, 0.8, 1]};
};

GVAR(dev_hitBoxes) set [getObjectID _object, [_object, _points, _color]];
