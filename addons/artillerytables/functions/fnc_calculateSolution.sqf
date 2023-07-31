#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point north and east, and recalculates a solution in air based on atmospheric conditions
 *
 * Arguments:
 * 0: Own Position ASL; 
 * 1: Target Position ASL
 * 2: muzzle velocity
 * 3: High angle boolean (true is high angle)
 * 4: air friction
 * 5: temperature 
 * 6: atmospheric density 
 * 7: direction of wind (in degrees)
 * 8: speed of wind in m/s
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: angle of shot - milliradians
 * 1: angle adjust left or right - milliradians
 * 2: time of flight
 *
 * Example:
 * [myPos, targetPos, 200, true, -0.0001, 15, 1.225, 225, 5] call ace_artilleryTables_fnc_calculateSolution
 *
 * Public: No
 */

params ["_ownPos", "_targetPos", "_muzzleVelocity", ["_highAngle", true], ["_airFriction", 0], ["_temperature", 15], ["_airDensity", 1.225], ["_windDir", 0], ["_windSpeed", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

private _relPos = _targetPos vectorDiff _ownPos;

private _targetDir = (_relpos select 0) atan2 (_relPos select 1);
private _targetDist = sqrt( (_relPos select 0)^2 + (_relpos select 1)^2 );
private _heightDif = _relPos select 2;
private _crossWind = sin(_targetDir - _windDir) * _windSpeed;
private _tailWind = -cos(_targetDir - _windDir) * _windSpeed;

private _solutionReturns = [_targetDist, _heightDif, _muzzleVelocity, _highAngle, _airFriction, _crossWind, _tailWind, _temperature, _airDensity] call FUNC(calculateElevation);

_solutionReturns;
