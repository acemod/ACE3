#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point north and east, and recalculates a solution in air based on atmospheric conditions
 *
 * Arguments:
 * 0: Distance to Target; meters <NUMBER>
 * 1: Height of target; meters, relative to gun altitude (positive means target higher than gun) <NUMBER>
 * 2: Muzzle velocity; meters/second <NUMBER>
 * 3: High angle boolean (true is high angle) <BOOL>
 * 4: Air Friction; meters^-1 [(m/s^2)/(m^2/s^2)] <NUMBER>
 * 5: Temperature; degrees Celsius <NUMBER>
 * 6: Atmospheric Density; kg/(meters^3) <NUMBER>
 * 7: Cross wind; meters/second (negative is Right to Left) <NUMBER>
 * 8: Tail wind; meters/second (negative is flying against the wind) <NUMBER>
 *
 * Return Value:
 * Array of returns <ARRAY>
 * 0: Angle of shot; Milliradians <NUMBER>
 * 1: Angle adjust left or right; Milliradians <NUMBER>
 * 2: Time of flight; seconds <NUMBER>
 *
 * Example:
 * [myPos, 0, 200, true, -0.0001, 15, 1.225, 5, -10] call ace_artilleryTables_fnc_simulateShot
 *
 * Public: No
 */

params ["_targetDistance", "_targetHeight", "_muzzleVelocity", ["_airFriction", 0], ["_highAngle", true], ["_temperature", 15], ["_airDensity", 1.225], ["_crossWind", 0], ["_tailWind", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

private _solutionReturns = parseSimpleArray ("ace_artilleryTables" callExtension ["getSolution", [_targetDistance, _targetHeight, _muzzleVelocity, _airFriction, _highAngle, _crossWind, _tailWind, _temperature, _airDensity/1.225]] select 0);
if (_solutionReturns isEqualTo [-1, -1, -1]) exitWith {_solutionReturns};

_solutionReturns params ["_elevation", "_tof", "_azimuthCorrection"];

[_elevation * RADTOMILS, _tof, _azimuthCorrection * RADTOMILS]
