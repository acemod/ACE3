/*
 * Author: KoffeinFlummi
 * Calculates the angle offset necessary to hit the current target.
 *
 * Arguments:
 * 0: distance to target in meters <NUMBER>
 * 1: current angle of the turret <NUMBER>
 * 2: maximum elevation of the turret <NUMBER>
 * 3: initSpeed of the projectile <NUMBER>
 * 4: airFriction of the projectile <NUMBER>
 * 5: maximum timeToLive of the projectile <NUMBER>
 * 6: simulationStep of the projectile <NUMBER>
 *
 * Return Value:
 * offset from the current angle necessary to hit the target <NUMBER>
 *
 * Example:
 * [1, 2, 3, 4, 5, 6, 7] call ace_fcs_fnc_getAngle
 *
 * Public: No
 */
#include "script_component.hpp"

#define PRECISION 0.1

params ["_distance", "_angleTarget", "_maxElev", "_initSpeed", "_airFriction", "_timeToLive", "_simulationStep"];

if (_simulationStep == 0) exitWith {_angleTarget};

private _fnc_traceBullet = {
    params ["_distance", "_angleTarget", "_maxElev", "_initSpeed", "_airFriction", "_timeToLive", "_simulationStep", "_angle"];

    _angle = _angle - _angleTarget;
    _angleTarget = 0;

    private _posTargetX = (cos _angleTarget) * _distance;
    private _posTargetY = (sin _angleTarget) * _distance;

    private _posX = 0;
    private _posY = 0;

    private _velocityX = (cos _angle) * _initSpeed;
    private _velocityY = (sin _angle) * _initSpeed;

    // trace the path of the bullet
    for "_i" from 1 to ((floor (_timeToLive / _simulationStep)) + 1) do {
        private _velocityMagnitude = sqrt (_velocityX^2 + _velocityY^2);

        _velocityX = _velocityX + _simulationStep * (_velocityX * _velocityMagnitude * _airFriction);
        _velocityY = _velocityY + _simulationStep * (_velocityY * _velocityMagnitude * _airFriction - 9.81);

        _posX = _posX + _velocityX * _simulationStep;
        _posY = _posY + _velocityY * _simulationStep;

        if (_posX >= _posTargetX) exitWith {}; // bullet passed the target
    };
    _posY - _posTargetY
};

private _data = [_distance, _angleTarget, _maxElev, _initSpeed, _airFriction, _timeToLive, _simulationStep, _maxElev];

if (_data call _fnc_traceBullet < 0) exitWith {_maxElev - _angleTarget};

// Newton Method / Secand Method
private _angle1 = _angleTarget;
private _angle2 = _maxElev;
private _it2 = 0;

_data set [7, _maxElev];
private _f1 = _data call _fnc_traceBullet;

if (abs _f1 <= PRECISION) exitWith {0};

while {abs _f1 > PRECISION} do {
    _data set [7, _angle2];
    private _f2 = _data call _fnc_traceBullet;

    _angle1 = _angle2;
    _angle2 = _angle2 - _f2 * (_angle2 - _angle1) / (_f2 - _f1);

    _f1 = _f2;
    _it2 = _it2 + 1;
};

_angle2 - _angleTarget
