#include "script_component.hpp"
/*
 * Author: PabstMirror
 * DEV to find a firing solution for a given range
 *
 * Arguments:
 * 0: Range to Hit (Meters) <NUMBER>
 * 1: Height To Hit (Meters) <NUMBER>
 * 2: Muzzle Velocity (M/S) <NUMBER>
 * 3: Air Friction <NUMBER>
 * 4: Time Step (seconds) (eg 1/50 will simulate 50 cycles per second) <NUMBER>
 *
 * Return Value:
 * [NUMBER - Elevation In Degrees, NUMBER - Shot Durration] <ARRAY>
 *
 * Example:
 * [_rangeToHit, _heightToHit, _muzzleVelocity, _airFriction, TIME_STEP] call ace_mk6mortar_fnc_dev_simulateFindSolution;
 *
 * Public: No
 */

#define MAX_ATTEMPTS 22
params ["_rangeToHit", "_heightToHit", "_muzzleVelocity", "_airFriction","_timeStep"];

private _maxElev = 90;
private _minElev = 45; //todo - Low Angle Howitzers???

private _error = 10000;
private _solutionElevation = -1;
private _lastTestResult = [];
private _numberOfAttempts = 0;

//(binary search)
while {(_numberOfAttempts < MAX_ATTEMPTS) && {(abs _error) > 0.2}} do {
    _numberOfAttempts = _numberOfAttempts + 1;
    _solutionElevation = (_maxElev + _minElev) / 2;
    _lastTestResult = [_solutionElevation, _muzzleVelocity, _airFriction, 15, 1, 0, 0, _heightToHit, _timeStep] call FUNC(dev_simulateShot);
    _error = _rangeToHit - (_lastTestResult select 0);
    if (_error > 0) then {
        _maxElev = _solutionElevation; //test range was short
    } else {
        _minElev = _solutionElevation; //test range was long
    };
};
if (_numberOfAttempts >= MAX_ATTEMPTS) exitWith {[]};

//return the elevation and time required
[_solutionElevation, (_lastTestResult select 1)]
