#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add a hitbox outline to an object
 *
 * Arguments:
 * 0: Object to draw hitbox <OBJECT>
 * 1: Add center sphere <BOOL>
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
    ["_obj", objNull, [objNull]],
    ["_addSphere", true, [false]]
];

if (isNull _obj) exitWith {};

// Grab the right hitBox
private _box = [];
if (_obj  isKindOf "CAManBase") then {
    if (vehicle _obj == _obj) then {
        _box = 0 boundingBox _obj;
    } else {
        _box = boundingBoxReal  [_obj, "Geometry"];
    };
} else {
    _box = boundingBoxReal  [_obj, "FireGeometry"];
};
_box params ["_lowP","_upP"];

// adjust with stance
private _stance = stance _obj;
switch (true) do {
    case (_stance isEqualTo "STAND"): {_upP set [2, 1.9];};
    case (_stance isEqualTo "CROUCH"): {_upP set [2, 1.3];};
    case (_stance isEqualTo "PRONE"): {_upP set [2, 0.8];};
};
private _centerPoint = ASLToAGL getPosASL _obj;

if (GVAR(dbgSphere) && {_addSphere && {vehicle _obj isEqualTo _obj}}) then {
    private _centerSphere = [getPosASL _obj, "yellow"] call FUNC(dev_sphereDraw);
    _centerSphere disableCollisionWith vehicle _obj;
    _centerSphere attachTo [_obj, _obj worldToModel _centerPoint];
};

// create an optimized outline
private _p1 = _upP;
private _p7 = _lowP;
private _points =[
    _upP,
    [_p1#0, _p7#1, _p1#2],
    [_p7#0, _p7#1, _p1#2],
    [_p7#0, _p1#1, _p1#2],
    [_p1#0, _p1#1, _p7#2],
    [_p1#0, _p7#1, _p7#2],
    _lowP,
    [_p7#0, _p1#1, _p7#2]
];

_color = switch (side _obj) do {
    case east: {[1, 0, 0, 1]};
    case resistance: {[0, 1, 0, 1]};
    default {[0, 0, 1, 1]};
};

GVAR(dev_hitBoxes) set [getObjectID _obj, [_obj, _points, _color]];