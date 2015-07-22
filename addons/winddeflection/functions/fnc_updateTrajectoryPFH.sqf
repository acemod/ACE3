/*
 * Author: Glowbal, Ruthberg
 * Handles wind deflection for projectiles.
 *
 * Arguments:
 * 0: bullet - Object the event handler is assigned to <OBJECT>
 * 1: airFriction - air friction of the bullet <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"

[{
    BEGIN_COUNTER(pfeh);

    private["_accel", "_accelRef", "_bulletSpeed", "_bulletVelocity", "_deleted", "_deltaT", "_drag", "_dragRef", "_isWind", "_lastTime", "_trueSpeed", "_trueVelocity"];

    _lastTime = (_this select 0) select 0;
    _deltaT = ACE_time - _lastTime;
    (_this select 0) set [0, ACE_time];
    _deleted = 0;
    _isWind = (vectorMagnitude ACE_wind > 0);

    {
        _x params ["_bullet", "_airFriction"];

        _bulletVelocity = velocity _bullet;
        _bulletSpeed = vectorMagnitude _bulletVelocity;

        if ((!alive _bullet) || {(_bullet isKindOf "BulletBase") && {_bulletSpeed < 100}}) then {
            GVAR(trackedBullets) deleteAt (_forEachIndex - _deleted);
            _deleted = _deleted + 1;
        } else {
            if (_isWind) then {
                _trueVelocity = _bulletVelocity vectorDiff ACE_wind;
                _trueSpeed = vectorMagnitude _trueVelocity;

                _dragRef = _deltaT * _airFriction * _bulletSpeed * _bulletSpeed;
                _accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
                _bulletVelocity = _bulletVelocity vectorDiff _accelRef;

                _drag = _deltaT * _airFriction * _trueSpeed;
                _accel = _trueVelocity vectorMultiply (_drag);
                _bulletVelocity = _bulletVelocity vectorAdd _accel;
            };
            _bullet setVelocity _bulletVelocity;
        };

    } forEach GVAR(trackedBullets);

    END_COUNTER(pfeh);

}, GVAR(simulationInterval), [ACE_time]] call CBA_fnc_addPerFrameHandler;
