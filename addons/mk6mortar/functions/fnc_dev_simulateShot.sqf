/*
 * Author: PabstMirror
 * DEV function to build mortar tables, very cpu intensive (never used durring normal gameplay)
 *
 * Arguments:
 * 0: Shot Angle (degrees) <NUMBER>
 * 1: Muzzle Velocity (m/s) <NUMBER>
 * 2: Air Friction <NUMBER>
 * 3: Tempeture (degres celcius) <NUMBER>
 * 4: Relative Air Denisty <NUMBER>
 * 5: Tail Wind (m/s) <NUMBER>
 * 6: Cross Wind (m/s) <NUMBER>
 * 7: Height Of Target (M) <NUMBER>
 * 8: Time Step (fraction of a second) <NUMBER>
 *
 * Return Value:
 * <ARRAY> [Distance Traveled<NUMBER>, Shot Time<NUMBER>, Offset (degrees)<NUMBER>]
 *
 * Example:
 * [45, 180, -0.0001, 15, 1, 10, 0, 0, 1/50] call ace_mk6mortar_fnc_dev_simulateShot;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_angleDeg", "_muzzleVelocity", "_airFriction", "_temp", "_relDensity", "_tailWind", "_crosswind", "_heightOfTarget", "_timeStep", "_wind", "_gravity", "_currentPos", "_currentVelocity", "_currentTime", "_lastPos", "_kCoefficent", "_aparentWind", "_changeInVelocity", "_linConversion", "_middlePos", "_middlePosOld", "_middleTotalTravelTime", "_offsetDeg"];

_angleDeg = _this select 0;
_muzzleVelocity = _this select 1;
_airFriction = _this select 2;
_temp = _this select 3;
_relDensity = _this select 4;
_tailWind = _this select 5;
_crosswind = _this select 6;
_heightOfTarget = _this select 7;
_timeStep = _this select 8;

_wind = [_crosswind, _tailWind, 0];
_gravity = [0,0,-9.8];

_currentPos = [0,0,0];
_muzzleVelocity = _muzzleVelocity * (((_temp + 273.13) / 288.13 - 1) / 40 + 1);
_currentVelocity = [0, (_muzzleVelocity * cos _angleDeg), (_muzzleVelocity * sin _angleDeg)];

_currentTime = 0;
_lastPos = _currentPos;

_kCoefficent = -1 * _relDensity * _airFriction;  //save ACE_time in the loop and compute once

while {((_currentVelocity select 2) > 0) || ((_currentPos select 2) >= _heightOfTarget)} do {
    _lastPos = _currentPos;

    _aparentWind = _wind vectorDiff _currentVelocity;
    _changeInVelocity = _gravity vectorAdd (_aparentWind vectorMultiply ((vectorMagnitude _aparentWind) * _kCoefficent));

    _currentVelocity = _currentVelocity vectorAdd (_changeInVelocity vectorMultiply _timeStep);

    _currentPos = _currentPos vectorAdd (_currentVelocity vectorMultiply _timeStep);
    _currentTime = _currentTime + _timeStep;
};

//Uses linearConversion to get a weighted average betwen points before and after dropping below target height
_linConversion = linearConversion [(_lastPos select 2), (_currentPos select 2), _heightOfTarget, 0, 1, true];
_middlePos = (_lastPos vectorMultiply (1 - _linConversion)) vectorAdd (_currentPos vectorMultiply (_linConversion));
// _middlePosOld = (_lastPos vectorAdd _currentPos) vectorMultiply 0.5;

//Same to find travel ACE_time
_middleTotalTravelTime = _currentTime - (_timeStep * (1-_linConversion));

//Find shot offset (from crosswind), in degrees
_offsetDeg = (_middlePos select 0) aTan2 (_middlePos select 1);

[(_middlePos select 1), _middleTotalTravelTime, _offsetDeg]
