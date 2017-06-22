/*
 * Author: commy2
 *
 * Fixes position of an object. E.g. moves object above ground and adjusts to terrain slope. Requires local object.
 *
 * Arguments:
 * Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_fixPosition
 *
 * Public: No
 */
#include "script_component.hpp"

// setVectorUp requires local object
if (!local _this) exitWith {};

if ((getText (configFile >> "CfgVehicles" >> (typeOf _this) >> "simulation")) == "house") then {
    //Houses don't have gravity/physics, so make sure they are not floating
    private _posAbove = (getPos _this) select 2;
    TRACE_2("house",_this,_posAbove);
    if (_posAbove > 0.1) then {
        private _newPosASL = (getPosASL _this) vectorDiff [0,0,_posAbove];
        _this setPosASL _newPosASL;
    };
};

private _position = getPos _this;

// don't place the object below the ground
if (_position select 2 < -0.1) then {
    _position set [2, -0.1];
    _this setPos _position;
};

// adjust position to sloped terrain, if placed on ground
if (getPosATL _this select 2 == _position select 2) then {
    _this setVectorUp surfaceNormal _position;
};
