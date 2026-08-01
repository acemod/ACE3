#include "..\script_component.hpp"
/*
 * Author: commy2, Jonpas
 * Fixes position of an object. E.g. moves object above ground and adjusts to terrain slope. Requires local object.
 *
 * Arguments:
 * Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_common_fnc_fixPosition
 *
 * Public: No
 */

// setVectorUp requires local object
if (!local _this) exitWith {};

// Objects with disabled simulation and objects with simulation type "house" don't have gravity/physics, so make sure they are not floating
private _hasGravity = simulationEnabled _this && {getText (configOf _this >> "simulation") != "house"};

private _positionASL = getPosASL _this;
_positionASL params ["_posX", "_posY", "_posZASL"];
// find top surface under object
private _surfaces = lineIntersectsSurfaces [_positionASL, ATLToASL [_posX, _posY, -1], _this];

TRACE_3("fixPosition",_this,_hasGravity,_surfaces);

if (!_hasGravity && {_surfaces isNotEqualTo []}) then {
    private _surfaceHeightASL = _surfaces select 0 select 0 select 2;
    if (_posZASL > _surfaceHeightASL + 0.1) then {
        _this setPosASL [_posX, _posY, _surfaceHeightASL];
    };
};

private _position = getPosATL _this;

// Don't place the object below the ground
if (_position select 2 < -0.1) then {
    _position set [2, -0.1];
    _this setPosATL _position;
};

// Adjust position to sloped surface, if placed on ground
// Object without gravity/physics may have negative height when placed on slope, but those objects are definitely on the ground
if (!_hasGravity || {getPosATL _this select 2 == _position select 2}) then {
    private _normal = if (_surfaces isEqualTo []) then {
        surfaceNormal _position
    } else {
        private _surfaceNormal = _surfaces select 0 select 1;
        // on flipped surfaces fallback to terrain
        if (_surfaceNormal select 2 > 0) then {
            _surfaceNormal
        } else {
            surfaceNormal _position
        }
    };
    _this setVectorUp _normal;
};
