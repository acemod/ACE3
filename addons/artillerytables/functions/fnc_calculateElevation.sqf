#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point north and east, and recalculates a solution in air based on atmospheric conditions
 *
 * Arguments:
 * 0: Distance to Target; 
 * 1: Height of target
 * 2: muzzle velocity
 * 3: High angle boolean (true is high angle)
 * 4: air friction
 * 5: temperature 
 * 6: atmospheric density 
 * 7: cross wind (negative is right to left) m/s
 * 8: tail wind (negative is flying into wind) m/s
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: angle of shot - milliradians
 * 1: angle adjust left or right - milliradians
 * 2: time of flight
 *
 * Example:
 * [myPos, 0, 200, true, -0.0001, 15, 1.225, 5, -10] call ace_artilleryTables_fnc_simulateShot
 *
 * Public: No
 */

params ["_targetDistance", "_targetHeight", "_muzzleVelocity", ["_highArc", true], ["_airFriction", 0], ["_temperature", 15], ["_airDensity", 1.225], ["_crossWind", 0], ["_tailWind", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

if (_airFriction != 0) then {
    _muzzleVelocity = [_muzzleVelocity, _temperature, _atmosphericDensity] call FUNC(calculateMuzzleVelocity);
};
private _maxResults = [_muzzleVelocity, _airFriction] call FUNC(calculateMaxAngle);

private _testShot = [_maxResults select 0, _targetHeight, _muzzleVelocity, _airFriction, _crossWind, _tailWind, _temperature, _airDensity] call FUNC(simulateShot);
if (_testShot select 1 < _targetDistance) exitWith {
    //No way we can hit it so don't bother;
    [-1, -1, -1]
};

private _useDistance = _targetDistance;
private _useAngle = 0;
private _resultDistance = 0;
private _xDeviation = 0;
private _tof = 0;

while {abs(_resultDistance - _targetDistance) > 0.5} do {
    private _useAngleRad = parseSimpleArray (("ace_artilleryTables" callExtension ["simulateFindSolution", [_useDistance, _targetHeight, _muzzleVelocity, _airFriction, _higharc]]) select 0) select 1; 
    _useAngle = deg(_useAngleRad) * 6400/360;

    private _shotResults = [_useAngle, _targetHeight, _muzzleVelocity, _airFriction, _crossWind, _tailWind, _temperature, _airDensity] call FUNC(simulateShot);
    
    _xDeviation = _shotResults select 0;
    _resultDistance = _shotResults select 1;
    _tof = _shotResults select 2;
    _useDistance = (2 * _targetDistance) - _resultDistance;
};

private _angleOffsetDeg = _xDeviation atan2 _resultDistance;
private _angleOffset = _angleOffsetDeg * 6400 / 360;

[_useAngle, -_angleOffset, _tof];
