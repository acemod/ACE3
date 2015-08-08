/*
 * Author: commy2
 *
 * Fixes position of an object. E.g. moves object above ground and adjusts to terrain slope. Requires local object.
 *
 * Arguments:
 * Object (Object)
 *
 * Return value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

// setVectorUp requires local object
if (!local _this) exitWith {};

private "_position";
_position = getPos _this;

// don't place the object below the ground
if (_position select 2 < -0.1) then {
    _position set [2, -0.1];
    _this setPos _position;
};

// adjust position to sloped terrain, if placed on ground
if (getPosATL _this select 2 == _position select 2) then {
    _this setVectorUp surfaceNormal _position;
};
