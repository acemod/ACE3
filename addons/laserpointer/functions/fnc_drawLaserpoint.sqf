// by commy2 and esteldunedain
#include "script_component.hpp"

private ["_p0", "_p1", "_p0Pos", "_offV1", "_offV2", "_offV3", "_camPos", "_intermediatePos", "_iteration", "_light", "_line", "_pL", "_pL2", "_pX", "_size", "_units", "_fnc_getDistanceToTerrain", "_fnc_doesIntersectWithMan"];

// init object
/*if (isNil QGVAR(laserdot)) then {
    _light = "#lightpoint" createVehicleLocal [0,0,0];
    _light setLightBrightness 10;
    _light setLightColor [1,0,0];
    _light setLightAmbient [1,0,0];
    _light setLightDayLight true;
    //_light lightAttachObject [GVAR(laserdot), [0,0,0]];
    _light setLightAttenuation [0.04,4,4,0,0.04,0.08];

    GVAR(laserdot) = _light;
};*/

EXPLODE_4_PVT(_this,_unit,_range,_isGreen,_brightness);

_p0Pos = _unit modelToWorldVisual (_unit selectionPosition "righthand");

// Convert _p0Pos to ASL
_p0 = + _p0Pos;
if (!surfaceIsWater _p0) then {
  _p0 = ATLtoASL _p0;
};

// Find a system of orthogonal reference vectors
// _v1 points in the direction of the weapon
// _v2 points to the right of the weapon
// _v3 points to the top side of the weapon
_v1 = _unit weaponDirection currentWeapon _unit;
_v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
_v3 = _v2 vectorCrossProduct _v1;

// Offset over the 3 reference axis
// This offset could eventually be configured by weapon in the config
_offV1 = 0.31;
_offV2 = 0;
_offV3 = 0.08;

// Offset _p0, the start of the laser
_p0    = _p0    vectorAdd (_v1 vectorMultiply _offV1) vectorAdd (_v3 vectorMultiply _offV3) vectorAdd (_v2 vectorMultiply _offV2);
_p0Pos = _p0Pos vectorAdd (_v1 vectorMultiply _offV1) vectorAdd (_v3 vectorMultiply _offV3) vectorAdd (_v2 vectorMultiply _offV2);
// Calculate _p1, the potential end of the laser
_p1    = _p0    vectorAdd (_v1 vectorMultiply _range);

//Debugaaa = lineIntersectsObjs [_p0, _p1, objNull, _unit, false, 2];

_fnc_getDistanceToTerrain = {
    private ["_distance"];

    _pX = + _p0;
    _line = [_p0, _pX];

    _distance = _this;
    _iteration = _distance;

    while {_iteration > 0.05 / 2} do {
        _iteration = _iteration / 2;

        _pX = _p0 vectorAdd (_v1 vectorMultiply _distance);

        _line set [1, _pX];

        _distance = _distance + (([1, -1] select (lineIntersects (_line + [_unit]) || {terrainIntersectASL _line})) * _iteration);

        if (_distance > _this) exitWith {_distance = _this};
    };

    _distance
};

// Get distance to nearest object or terrain (excluding men)
_distance = _range call _fnc_getDistanceToTerrain;

// Find all men potentially intercepted by the ray
_intermediatePos = _p0 vectorAdd (_v1 vectorMultiply _distance/2);
if (!surfaceIsWater _intermediatePos) then {
  _intermediatePos = ASLtoATL _intermediatePos;
};
_units = nearestObjects [_intermediatePos, ["Man"], _distance/2];

_units deleteAt (_units find _unit);

_fnc_doesIntersectWithMan = {
    _pX = _p0 vectorAdd (_v1 vectorMultiply (_this select 1));
    if (!surfaceIsWater _pX) then {
      _pX = ASLtoATL _pX;
    };
    count ([_this select 0, "FIRE"] intersect [_p0Pos, _pX]) > 0
};

// Test intersection with nearby men
{
    if ([_x, _distance] call _fnc_doesIntersectWithMan) then {
        _distance = _distance min ((_unit distance _x) - _offV1);
    };
} forEach _units;

//systemChat str _distance;
if (_distance < 0.5) exitWith {};

_pL = _p0 vectorAdd (_v1 vectorMultiply _distance);
_pL2 = _p0 vectorAdd (_v1 vectorMultiply (_distance - 0.5));

// Convert _pL to pos
if (!surfaceIsWater _pL) then {
  _pL = ASLtoATL _pL;
};

/*
drawLine3D [
    _p0Pos,
    _pL,
    [[1,0,0,1], [0,1,0,1]] select _isGreen
];
*/

_size = 2 * (_range - (positionCameraToWorld [0,0,0] vectorDistance _pL)) / _range;

_camPos = positionCameraToWorld [0,0,0.2];
if (count ([_unit,      "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};
if (count ([ACE_player, "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};

// Convert _camPos to ASL
if (!surfaceIsWater _camPos) then { _camPos = ATLtoASL _camPos; };
if (                  terrainIntersectASL [_camPos, _pL2])     exitWith {};
if (                       lineIntersects [_camPos, _pL2])     exitWith {};

//GVAR(laserdot) setPos _pL;

drawIcon3D [
    format ["\a3\weapons_f\acc\data\collimdot_%1_ca.paa", ["red", "green"] select _isGreen],
    [[1,0.25,0.25,0.5*_brightness], [0.25,1,0.25,0.5*_brightness]] select _isGreen,
    _pL,
    _size,
    _size,
    45,
    "",
    0,
    0.05
];
