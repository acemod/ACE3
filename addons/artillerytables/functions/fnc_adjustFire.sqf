#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point north and east, and recalculates a solution in air based on atmospheric conditions
 *
 * Arguments:
 * 0: Gun Position ASL <ARRAY>
 * 1: Target Position ASL <ARRAY>
 * 2: Adjustment to the East (negative is West); meters <NUMBER>
 * 3: Adjustment to the North (negative is South); meters <NUMBER>
 * 4: Adjustment vertically (negative is Down); meters <NUMBER>
 * 5: Muzzle velocity; meters/second <NUMBER>
 * 6: Air Friction; meters^-1 (m/s^2)/(m^2/s^2) <NUMBER>
 * 7: High angle boolean (true is high angle) <BOOL>
 * 8: Temperature; degrees Celsius <NUMBER>
 * 9: Atmospheric Density; kg/(meters^3) <NUMBER>
 * 10: Direction of wind; degrees clockwise from north <NUMBER>
 * 11: Speed of wind; meters/second <NUMBER>
 *
 * Return Value:
 * Array of returns <ARRAY>
 * 0: Angle of shot; Milliradians <NUMBER>
 * 1: Angle adjust left or right; Milliradians <NUMBER>
 * 2: Time of flight; seconds <NUMBER>
 *
 * Example:
 * [getposASL vehicle player, targetPos, 20, 50, 0, 200, -0.0001, true, 15, 1.225, 225, 5] call ace_artilleryTables_fnc_adjustFire
 *
 * Public: No
 */

params ["_gunPos", "_targetPos", "_adjustEast", "_adjustNorth", "_adjustUp", "_muzzleVelocity", "_airFriction", ["_highAngle", true], ["_temperature", 15], ["_airDensity", 1.225], ["_windDir", 0], ["_windSpeed", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

private _resultPos = _targetPos vectorAdd [_adjustEast, _adjustNorth, _adjustUp];

private _returns = [_gunPos, _resultPos, _muzzleVelocity, _highAngle, _airFriction, _temperature, _airDensity, _windDir, _windSpeed] call FUNC(calculateSolution);

_returns
