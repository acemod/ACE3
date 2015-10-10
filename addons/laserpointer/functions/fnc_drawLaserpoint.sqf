// by commy2 and esteldunedain
#include "script_component.hpp"

params ["_unit", "_range", "_isGreen", "_brightness"];

private ["_p0", "_v1", "_v2", "_v3", "_p1", "_pL", "_distance", "_pL2", "_camPos", "_size"];

_p0 = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "righthand"));

// Find a system of orthogonal reference vectors
// _v1 points in the direction of the weapon
// _v2 points to the right of the weapon
// _v3 points to the top side of the weapon
_v1 = _unit weaponDirection currentWeapon _unit;
_v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
_v3 = _v2 vectorCrossProduct _v1;

// Offset over the 3 reference axis
// This offset could eventually be configured by weapon in the config
#define OFFV1 0.31
#define OFFV2 0
#define OFFV3 0.08

// Offset _p0, the start of the laser
_p0    = _p0    vectorAdd (_v1 vectorMultiply OFFV1) vectorAdd (_v3 vectorMultiply OFFV3) vectorAdd (_v2 vectorMultiply OFFV2);

// Calculate _p1, the potential end of the laser
_p1    = _p0    vectorAdd (_v1 vectorMultiply _range);

_pL = lineIntersectsSurfaces [_p0, _p1, ACE_player, vehicle ACE_player, true, 1, "GEOM", "FIRE"] select 0 select 0;

// no intersection found, quit
if (isNil "_pL") exitWith {};

_distance = _p0 vectorDistance _pL;

//systemChat str _distance;
if (_distance < 0.5) exitWith {};

_pL = _p0 vectorAdd (_v1 vectorMultiply _distance);
_pL2 = _p0 vectorAdd (_v1 vectorMultiply (_distance - 0.5));

_pL = ASLtoAGL _pL;

/*
drawLine3D [
    _p0,
    _pL,
    [[1,0,0,1], [0,1,0,1]] select _isGreen
];
*/

//systemChat str [_unit, "FIRE"] intersect [_camPos, _pL];

_camPos = positionCameraToWorld [0,0,0.2];
if (count ([_unit,      "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};
if (count ([ACE_player, "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};

// Convert _camPos to ASL
_camPos = AGLToASL _camPos;

if (                  terrainIntersectASL [_camPos, _pL2])     exitWith {};
if (                       lineIntersects [_camPos, _pL2])     exitWith {};

_size = 2 * (_range - (positionCameraToWorld [0,0,0] vectorDistance _pL)) / _range;

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
