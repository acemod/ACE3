#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add a hit box outline to an object, outdated for unit hits as they
 * use hit-point locations.
 *
 * Arguments:
 * 0: Object to draw the hit box of <OBJECT>
 * 1: Add sphere at object origin <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_frag_fnc_dev_trackHitBox;
 *
 * Public: No
 */
params [
    ["_object", objNull, [objNull]],
    ["_addSphere", true, [true]]
];
TRACE_2("Adding hitbox",_object,_addSphere);

if (isNull _object) exitWith {};

// Grab the right hitBox
private _box = [];
if (_object isKindOf "CAManBase") then {
    if (isNull objectParent _object) then {
        _box = 0 boundingBox _object;
    } else {
        _box = boundingBoxReal [_object, "Geometry"];
    };
} else {
    _box = boundingBoxReal [_object, "FireGeometry"];
};
_box params ["_lowP", "_upP"];

// adjust with stance
switch (stance _object) do {
    case "STAND": {_upP set [2, 1.9];};
    case "CROUCH": {_upP set [2, 1.3];};
    case "PRONE": {_upP set [2, 0.8];};
};
private _centerPoint = ASLToAGL getPosASL _object;

if (GVAR(dbgSphere) && {_addSphere && {isNull objectParent _object}}) then {
    private _centerSphere = [getPosASL _object, "yellow"] call FUNC(dev_sphereDraw);
    _centerSphere disableCollisionWith vehicle _object;
    _centerSphere attachTo [_object, _object worldToModel _centerPoint];
};

// create an optimized outline
private _p1 = _upP;
private _p7 = _lowP;
private _points = [
    _upP,
    [_p1#0, _p7#1, _p1#2],
    [_p7#0, _p7#1, _p1#2],
    [_p7#0, _p1#1, _p1#2],
    [_p1#0, _p1#1, _p7#2],
    [_p1#0, _p7#1, _p7#2],
    _lowP,
    [_p7#0, _p1#1, _p7#2]
];

_color = switch (side _object) do {
    case east: {[1, 0, 0, 1]};
    case resistance: {[0, 1, 0, 1]};
    default {[0, 0, 1, 1]};
};

GVAR(dev_hitBoxes) set [getObjectID _object, [_object, _points, _color]];
