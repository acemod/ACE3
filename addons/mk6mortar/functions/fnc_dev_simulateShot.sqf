/*
Name: simulateShot

Author: Pabst Mirror

Description:
  Simulates the path of a fired shell.

Parameters:
  0: NUMBER - Shot Angle (degrees)
  1: NUMBER - Muzzle Velocity (m/s)
  2: NUMBER - Air Friction
  3: NUMBER - Tempeture (degres celcius)
  4: NUMBER - Relative Air Denisty
  5: NUMBER - Tail Wind (m/s)
  6: NUMBER - Cross Wind (m/s)
  7: NUMBER - Height Of Target (M)
  8: NUMBER - Time Step (fraction of a second)

Returns:
  ARRAY -
    NUMBER - Distance Traveld
    NUMBER - Shot Time
    NUMBER - Offset (degrees)

Example:
  [45, 180, -0.0001, 15, 1, 10, 0, 0, 1/50] call simulateShot;
*/
#include "script_component.hpp"

private ["_angleDeg", "_muzzleVelocity", "_airFriction", "_temp", "_relDensity", "_tailWind", "_crosswind", "_heightOfTarget", "_wind", "_gravity", "_timeStep", "_currentPos", "_currentVelocity", "_currentTime", "_lastPos", "_kCoefficent", "_aparentWind", "_changeInVelocity", "_linConversion", "_middlePos", "_middlePosOld", "_middleTotalTravelTime", "_offsetDeg"];

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

_kCoefficent = -1 * _relDensity * _airFriction;  //save time in the loop and compute once

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

//Same to find travel time
_middleTotalTravelTime = _currentTime - (_timeStep * (1-_linConversion));

//Find shot offset (from crosswind), in degrees
 _offsetDeg = (_middlePos select 0) aTan2 (_middlePos select 1);

[(_middlePos select 1), _middleTotalTravelTime, _offsetDeg]
