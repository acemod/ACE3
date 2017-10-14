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

params ["_muzzleVelocity", "_rangeToHit", "_airFriction"];

private _startTime = diag_tickTime;



//Run Binary search for correct elevation
private _solution = [_rangeToHit, 0, _muzzleVelocity, _airFriction, TIME_STEP] call FUNC(dev_simulateFindSolution);
if (_solution isEqualTo []) exitWith {[]};

//Real Elevation
private _lineElevation = _solution select 0;

//Time Of Flight:
private _lineTimeOfFlight = _solution select 1;

//Height Adjustment for -100m (another binary search)
private _solution = [_rangeToHit, -100, _muzzleVelocity, _airFriction, TIME_STEP] call FUNC(dev_simulateFindSolution);
if (_solution isEqualTo []) exitWith {[]};//should never be triggered (lower elevation easier to hit)

private _lineHeightElevation = ((_solution select 0) - _lineElevation);
private _lineHeightTimeDelta = (_solution select 1) - _lineTimeOfFlight;

//Compute for 10x and divide to minimize rounding errors

//Crosswind
private _lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, 0, 10, 0, TIME_STEP] call FUNC(dev_simulateShot);
private _lineCrosswindDeg = (_lastTestResult select 2) / 10;

//Headwind:
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, -10, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
private _lineHeadwindMeters = (_rangeToHit - (_lastTestResult select 0)) / 10;

//TailWind:
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1, 10, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
private _lineTailWindMeters = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Temp Dec
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, (15 - 10), 1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineTempDec = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Temp Inc
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, (15 + 10), 1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
_lineTempInc = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Density Dec
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 0.9, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
private _lineAirDensDec = (_rangeToHit - (_lastTestResult select 0)) / 10;

//Air Density Inc
_lastTestResult = [_lineElevation, _muzzleVelocity, _airFriction, 15, 1.1, 0, 0, 0, TIME_STEP] call FUNC(dev_simulateShot);
private _lineAirDensInc = (_rangeToHit - (_lastTestResult select 0)) / 10;

// systemChat format ["debug: Range %1 - in %2 sec", _rangeToHit, (diag_tickTime - _startTime)];

[_rangeToHit, _lineElevation, _lineHeightElevation, _lineHeightTimeDelta, _lineTimeOfFlight, _lineCrosswindDeg, _lineHeadwindMeters, _lineTailWindMeters, _lineTempDec, _lineTempInc, _lineAirDensDec, _lineAirDensInc]
