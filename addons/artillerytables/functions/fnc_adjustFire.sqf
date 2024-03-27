#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point using add/drop, left/right, and up/down with an observer direction, 
 * and recalculates a solution from a gun based on atmospheric conditions
 *
 * Arguments:
 * 0: Gun Position ASL <ARRAY>
 * 1: Target Position ASL <ARRAY>
 * 2: Observer Direction 
 * 3: Adjustment in distance (negative is towards observer); meters <NUMBER>
 * 4: Adjustment to the right (negative is Left); meters <NUMBER>
 * 5: Adjustment vertically (negative is Down); meters <NUMBER>
 * 6: Muzzle velocity; meters/second <NUMBER>
 * 7: Air Friction; meters^-1 (m/s^2)/(m^2/s^2) <NUMBER>
 * 8: High angle boolean (true is high angle) <BOOL>
 * 9: Temperature; degrees Celsius <NUMBER>
 * 10: Atmospheric Density; kg/(meters^3) <NUMBER>
 * 11: Direction of wind; degrees clockwise from north <NUMBER>
 * 12: Speed of wind; meters/second <NUMBER>
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

params ["_gunPos", "_targetPos", "_observerDir", "_adjustAdd", "_adjustRight", "_adjustUp", "_muzzleVelocity", "_airFriction", ["_highAngle", true], ["_temperature", 15], ["_airDensity", 1.225], ["_windDir", 0], ["_windSpeed", 0]];
//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

private _newTargetPos = _targetPos vectorAdd [(_adjustRight * cos(_observerDir)) + (_adjustAdd * sin(_observerDir)), (_adjustAdd * cos(_observerDir)) - (_adjustRight * sin(_observerDir)), _adjustUp];
private _targetDiff = _targetPos vectorDiff _gunPos;
private _newTargetDiff = _newTargetPos vectorDiff _gunPos;

private _directionToTarget = (_targetDiff select 0) atan2 (_targetDiff select 1);
private _newDirectionToTarget = (_newTargetDiff select 0) atan2 (_newTargetDiff select 1);
private _windReturns = [_newDirectionToTarget, _windDir, _windSpeed] call FUNC(calculateWinds);

private _returns = ["_gunPos", "_newTargetPos", "_muzzleVelocity", "_highAngle", "_airFriction", "_temperature", "_airDensity", "_windDir", "_windSpeed"] call FUNC(calculateSolution);

_returns
