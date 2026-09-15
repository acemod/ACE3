#include "..\script_component.hpp"
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
 * [myPos, 0, 200, true, -0.0001, 15, 1.225, 5, -10] call ace_artilleryTables_fnc_calculateElevation
 *
 * Public: No
 */

params ["_targetDistance", "_targetHeight", "_muzzleVelocity", ["_highArc", true], ["_airFriction", 0], ["_temperature", 15], ["_airDensity", 1.225], ["_crossWind", 0], ["_tailWind", 0]];

//DEFAULT_AIR_FRICTION == -0.00006
//MK6_82mm_AIR_FRICTION == -0.0001

if (_airFriction != 0) then {
    _muzzleVelocity = [_muzzleVelocity, _temperature] call FUNC(calculateMuzzleVelocity);
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
    TRACE_7("callExtension:artillery:simulate_find_solution",_useDistance,_targetHeight,_muzzleVelocity,_airFriction,_higharc,DEFAULT_MIN_ELEV,DEFAULT_MAX_ELEV);
    (
        "ace" callExtension ["artillery:simulate_find_solution", [_useDistance, _targetHeight, _muzzleVelocity, _airFriction, _higharc, DEFAULT_MIN_ELEV, DEFAULT_MAX_ELEV]]
    ) params ["_data", "_code"];
    TRACE_1("",_code);
    (parseSimpleArray _data) params ["", "_useAngleRad", ""];
    _useAngle = deg(_useAngleRad) * DEGTOMILS;

    private _shotResults = [_useAngle, _targetHeight, _muzzleVelocity, _airFriction, _crossWind, _tailWind, _temperature, _airDensity] call FUNC(simulateShot);

    _xDeviation = _shotResults select 0;
    _resultDistance = _shotResults select 1;
    _tof = _shotResults select 2;
    _useDistance = (2 * _targetDistance) - _resultDistance;
};

private _angleOffsetDeg = _xDeviation atan2 _resultDistance;
private _angleOffset = _angleOffsetDeg * DEGTOMILS;

[_useAngle, -_angleOffset, _tof]
