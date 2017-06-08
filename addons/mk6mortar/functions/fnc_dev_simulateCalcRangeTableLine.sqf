/*
 * Author: Pabst Mirror
 * Builds a rangeTable line for a certian range, given muzzle velocity and air friction, returns [] if out of range.
 *
 * Arguments:
 * 0: Muzzle Velocity <NUMBER>
 * 1: Air Friction <NUMBER>
 * 2: Range To Hit <NUMBER>
 *
 * Return Value:
 * Range Table Line Data (see return line) <ARRAY>
 *
 * Example:
 * [300, -0.0001, 3000] call ace_mk6mortar_fnc_simulateCalcRangeTableLine
 *
 * Public: No
 */
#include "script_component.hpp"

#define TIME_STEP (1/50)

private ["_startTime", "_muzzleVelocity", "_rangeToHit", "_airFriction", "_vacElevation", "_radicand", "_maxElev", "_minElev", "_error", "_solutionElevation", "_lastTestResult", "_numberOfAttempts", "_lineElevation", "_lineTimeOfFlight", "_lineHeightElevation", "_lineHeightTimeDelta", "_lineCrosswindDeg", "_lineHeadwindMeters", "_lineTailWindMeters", "_result"];

_startTime = diag_tickTime;

_muzzleVelocity = _this select 0;
_rangeToHit = _this select 1;
_airFriction = _this select 2;

//Run Binary search for correct elevation
_solution = [_rangeToHit, 0, _muzzleVelocity, _airFriction, TIME_STEP] call FUNC(dev_simulateFindSolution);
if (_solution isEqualTo []) exitWith {[]};

//Real Elevation
_lineElevation = _solution select 0;

//Time Of Flight:
_lineTimeOfFlight = _solution select 1;

//Height Adjustment for -100m (another binary search)
_solution = [_rangeToHit, -100, _muzzleVelocity, _airFriction, TIME_STEP] call FUNC(dev_simulateFindSolution);
if (_solution isEqualTo []) exitWith {[]};//should never be triggered (lower elevation easier to hit)

_lineHeightElevation = ((_solution select 0) - _lineElevation);
_lineHeightTimeDelta = (_solution select 1) - _lineTimeOfFlight;

//Compute for 10x and divide to minimize rounding errors

//Crosswind
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, 0, 10, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineCrosswindDeg = (_lastTestResult select 2) / 10;

//Headwind:
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, -10, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineHeadwindMeters = (_rangeToHit - (_lastTestResult select 0)) / 10;

//TailWind:
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, 10, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineTailWindMeters = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Temp Dec
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, (15 - 10), 1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineTempDec = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Temp Inc
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, (15 + 10), 1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineTempInc = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Density Dec
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 0.9, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineAirDensDec = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Density Inc
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1.1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineAirDensInc = (_rangeToHit - (_lastTestResult select 0)) / 10;

// systemChat format ["debug: Range %1 - in %2 sec", _rangeToHit, (diag_tickTime - _startTime)];

[_rangeToHit, _lineElevation, _lineHeightElevation, _lineHeightTimeDelta, _lineTimeOfFlight, _lineCrosswindDeg, _lineHeadwindMeters, _lineTailWindMeters, _lineTempDec, _lineTempInc, _lineAirDensDec, _lineAirDensInc]
