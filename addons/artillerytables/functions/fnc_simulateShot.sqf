#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Simulates an indirect shot on a target of known height in given atmospheric conditions
 *
 * Arguments:
 * 0: angle - in milliradians 
 * 1: target Height
 * 2: muzzle velocity
 * 3: air friction
 * 4: cross wind - negative is right-to-left
 * 5: tail wind - negative is flying into the wind
 * 6: temperature 
 * 7: atmospheric density 
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: left-right Deviation
 * 1: distance of shot
 * 2: time of flight
 *
 * Example:
 * [900, 10, 200, -0.0001, 4, 0, 15, 1.225] call ace_artilleryTables_fnc_simulateShot
 *
 * Public: No
 */

params ["_angle", "_targetHeight", "_muzzleVelocity", ["_airFriction", 0], ["_crossWind", 0], ["_tailWind", 0], ["_temperature", 15], ["_atmosphericDensity", 1.225]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

if (_airFriction != 0) then {
    _muzzleVelocity = [_muzzleVelocity, _temperature, _atmosphericDensity] call FUNC(calculateMuzzleVelocity);
};

private _atmosphericDensityRatio = _atmosphericDensity / 1.225;
private _radAngle = rad(_angle * 360 / 6400);

private _returns = parseSimpleArray (("ace_artilleryTables" callExtension ["simulateShot", [_radAngle, _targetHeight, _muzzleVelocity, _airFriction, _crossWind, _tailWind, _temperature, _atmosphericDensityRatio]]) select 0); 

//[xDeviation, yDistance, timeOfFlight]
_returns; 
