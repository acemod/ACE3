#include "script_component.hpp"
/*
 * Author: commy2 and esteldunedain
 * Draw a Laser Point
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 * 1: Range <NUMBER>
 * 2: is Green <BOOL>
 * 3: Brightness <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 10, false, 2] call ace_laserpointer_fnc_drawLaserpoint
 *
 * Public: No
 */

params ["_target", "_range", "_isGreen", "_brightness"];

private _unit = ACE_player;

private _p0 = AGLToASL (_target modelToWorldVisual (_target selectionPosition "righthand"));

// Find a system of orthogonal reference vectors
// _v1 points in the direction of the weapon
// _v2 points to the right of the weapon
// _v3 points to the top side of the weapon
private _v1 = _target weaponDirection currentWeapon _target;
private _v2 = vectorNormalized (_v1 vectorCrossProduct [0,0,1]);
private _v3 = _v2 vectorCrossProduct _v1;

// Offset over the 3 reference axis
// This offset could eventually be configured by weapon in the config
#define OFFV1 0.31
#define OFFV2 0
#define OFFV3 0.08

// Offset _p0, the start of the laser
_p0 = _p0 vectorAdd (_v1 vectorMultiply OFFV1) vectorAdd (_v3 vectorMultiply OFFV3) vectorAdd (_v2 vectorMultiply OFFV2);

// Calculate _p1, the potential end of the laser
private _p1 = _p0 vectorAdd (_v1 vectorMultiply _range);

private _pL = lineIntersectsSurfaces [_p0, _p1, _unit, vehicle _unit] select 0 select 0;

// no intersection found, quit
if (isNil "_pL") exitWith {};

private _distance = _p0 vectorDistance _pL;

//systemChat str _distance;
if (_distance < 0.5) exitWith {};

_pL = _p0 vectorAdd (_v1 vectorMultiply _distance);

private _pL2 = _p0 vectorAdd (_v1 vectorMultiply (_distance - 0.5));

_pL = ASLtoAGL _pL;

/*
drawLine3D [
    _p0,
    _pL,
    [[1,0,0,1], [0,1,0,1]] select _isGreen
];
*/

//systemChat str [_target, "FIRE"] intersect [_camPos, _pL];

private _camPos = positionCameraToWorld [0,0,0.2];

if (count ([_target, "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};
if (count ([_unit, "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};

// Convert _camPos to ASL
_camPos = AGLToASL _camPos;

if (terrainIntersectASL [_camPos, _pL2]) exitWith {};
if (lineIntersects [_camPos, _pL2]) exitWith {};

private _size = 2 * sqrt (1 / _distance) * (call EFUNC(common,getZoom));

drawIcon3D [
    format ["\a3\weapons_f\acc\data\collimdot_%1_ca.paa", ["red", "green"] select _isGreen],
    [[1,0.25,0.25,0.6*_brightness], [0.25,1,0.25,0.5*_brightness]] select _isGreen,
    _pL,
    _size,
    _size,
    45,
    "",
    0,
    0.05
];
