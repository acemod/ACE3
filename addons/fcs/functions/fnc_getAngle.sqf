/*
 * Author: KoffeinFlummi
 *
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
 * Public: No
 */
#include "script_component.hpp"
#define PRECISION 0.1

private ["_angle1", "_angle2", "_it2", "_f1", "_f2", "_temp", "_it1", "_angle"];
params ["_distance", "_angleTarget", "_maxElev", "_initSpeed", "_airFriction", "_timeToLive", "_simulationStep"]

if (_simulationStep == 0) exitWith {_angleTarget};

FUNC(traceBullet) = {
    private ["_posTargetX", "_posTargetY", "_posX", "_posY", "_velocityX", "_velocityY", "_velocityMagnitude", "_i"];
    params ["_distance", "_angleTarget", "_maxElev", "_initSpeed", "_airFriction", "_timeToLive", "_simulationStep", "_angle"];

    _angle = _angle - _angleTarget;
    _angleTarget = 0;

    _posTargetX = (cos _angleTarget) * _distance;
    _posTargetY = (sin _angleTarget) * _distance;

    _posX = 0;
    _posY = 0;

    _velocityX = (cos _angle) * _initSpeed;
    _velocityY = (sin _angle) * _initSpeed;

    // trace the path of the bullet
    for "_i" from 1 to ((floor (_timeToLive / _simulationStep)) + 1) do {
        _velocityMagnitude = sqrt (_velocityX^2 + _velocityY^2);
        _velocityX = _velocityX + _simulationStep * (_velocityX * _velocityMagnitude * _airFriction);
        _velocityY = _velocityY + _simulationStep * (_velocityY * _velocityMagnitude * _airFriction - 9.81);
        _posX = _posX + _velocityX * _simulationStep;
        _posY = _posY + _velocityY * _simulationStep;
        if (_posX >= _posTargetX) exitWith {}; // bullet passed the target
    };

    _posY - _posTargetY
};

if ((_this + [_maxElev]) call FUNC(traceBullet) < 0) exitWith {_maxElev - _angleTarget};

// Newton Method / Secand Method
_angle1 = _angleTarget;
_angle2 = _maxElev;
_it2 = 0;
_f1 = (_this + [_angle1]) call FUNC(traceBullet);

if ((abs _f1) <= PRECISION) exitWith {0};
while {(abs _f1) > PRECISION} do {
    _f2 = (_this + [_angle2]) call FUNC(traceBullet);
    _temp = _angle2-_f2*(_angle2-_angle1)/(_f2-_f1);
    _angle1 = _angle2;
    _angle2 = _temp;
    _f1 = _f2;
    _it2 = _it2+1;
};
//player globalChat format ["it1: %1 | _angle1: %2 | it2: %3 | _angle2: %4",_it1, _angle-_angleTarget, _it2, _angle2-_angleTarget];

_angle=_angle2;
_angle - _angleTarget
