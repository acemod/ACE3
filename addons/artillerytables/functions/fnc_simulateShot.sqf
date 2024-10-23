#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Simulates an indirect shot on a target of known height with given drag, wind, and atmospheric conditions
 *
 * Arguments:
 * 0: Gun Elevation Angle; milliradians <NUMBER>
 * 1: Relative Target Height; meters, relative to gun altitude (positive means target higher than gun) <NUMBER>
 * 2: Muzzle Velocity; meters/second <NUMBER>
 * 3: Air Friction; meters^-1 [(m/s^2)/(m^2/s^2)] <NUMBER>
 * 4: Cross wind; meters/second (negative is Right to Left) <NUMBER>
 * 5: Tail wind; meters/second (negative is flying against the wind) <NUMBER>
 * 6: Temperature; degrees Celsius <NUMBER>
 * 7: Atmospheric Density; kg/(meters^3) <NUMBER>
 *
 * Return Value:
 * array of returns <ARRAY>
 * 0: Deflection Adjustment To Hit; Milliradians (negative is Left) <NUMBER>
 * 1: Distance of Shot; meters <NUMBER>
 * 2: Time of Flight; seconds <NUMBER>
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
    _muzzleVelocity = [_muzzleVelocity, _temperature] call FUNC(calculateMuzzleVelocity);
};

private _atmosphericDensityRatio = _atmosphericDensity / 1.225;
private _radAngle = rad(_angle / DEGTOMILS);

TRACE_8("callExtension:artillery:simulate_shot",_radAngle,_targetHeight,_muzzleVelocity,_airFriction,_crossWind,_tailWind,_temperature,_atmosphericDensityRatio);
(
    "ace" callExtension ["artillery:simulate_shot", [_radAngle, _targetHeight, _muzzleVelocity, _airFriction, _crossWind, _tailWind, _temperature, _atmosphericDensityRatio]]
) params ["_data", "_code"];
TRACE_1("",_code);

//[xDeviation, yDistance, timeOfFlight]
parseSimpleArray _data
