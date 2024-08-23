#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Provides fire angle and deflection solutions on a target of set distance and height, including accounting for drag and atmospheric wind conditions.
 *
 * Arguments:
 * 0: Gun Position ASL; <ARRAY>
 * 1: Target Position ASL; <ARRAY>
 * 2: Muzzle Velocity; meters/second <NUMBER>
 * 3: High angle boolean (true is high angle) <BOOL>
 * 4: Air Friction; meters^-1 [(m/s^2)/(m^2/s^2)] <NUMBER>
 * 5: Temperature; degrees Celsius <NUMBER>
 * 6: Atmospheric Density; kg/(meters^3) <NUMBER>
 * 7: Direction of wind; degrees clockwise from north <NUMBER>
 * 8: Speed of wind; meters/second <NUMBER>
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: Angle of shot; Milliradians <NUMBER>
 * 1: Angle adjust left or right; Milliradians <NUMBER>
 * 2: Time of flight; seconds <NUMBER>
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

_solutionReturns
