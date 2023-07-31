#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjusts a target point north and east, and recalculates a solution in air based on atmospheric conditions
 *
 * Arguments:
 * 0: Own Position ASL; 
 * 1: Target Position ASL
 * 2: adjustment to the East (negative is west)
 * 3: adjustment to the North (negative is south) 
 * 4: adjustment upward (negative is down)
 * 5: muzzle velocity
 * 6: air friction
 * 7: High angle boolean (true is high angle)
 * 8: temperature 
 * 9: atmospheric density 
 * 10: direction of wind (in degrees)
 * 11: speed of wind in m/s
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: angle of shot - milliradians
 * 1: angle adjust left or right - milliradians
 * 2: time of flight
 *
 * Example:
 * [myPos, targetPos, 20, 50, 0, 200, -0.0001, true, 15, 1.225, 225, 5] call ace_artilleryTables_fnc_adjustFire
 *
 * Public: No
 */

params ["_ownPos", "_targetPos", "_adjustEast", "_adjustNorth", "_adjustUp", "_muzzleVelocity", "_airFriction", ["_highAngle", true], ["_temperature", 15], ["_airDensity", 1.225], ["_windDir", 0], ["_windSpeed", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

private _resultPos = [_adjustEast + _targetPos select 0, _adjustNorth + _targetPos select 1, _adjustUp + _targetPos select 2];

private _returns = ["_ownPos", "_targetPos", "_muzzleVelocity", "_highAngle", "_airFriction", "_temperature", "_airDensity", "_windDir", "_windSpeed"] call FUNC(calculateSolution);

_returns;
