/*
 * Author: Glowbal, Ruthberg
 * Handles wind deflection for projectiles.
 *
 * Arguments:
 * 0: bullet - Object the event handler is assigned to <OBJECT>
 * 1: airFriction - air friction of the bullet <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bullet, 2] call ace_winddeflection_fnc_updateTrajectoryPFH
 *
 * Public: No
 */
// #define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"

[{
    // BEGIN_COUNTER(pfeh);

    params ["_args"];
    _args params ["_lastTime"];
    private _deltaT = CBA_missionTime - _lastTime;
    _args set [0, CBA_missionTime];
    private _isWind = (vectorMagnitude wind > 0);

    {
        _x params ["_bullet", "_airFriction"];

        private _bulletVelocity = velocity _bullet;
        private _bulletSpeedSqr = vectorMagnitudeSqr _bulletVelocity;

        if ((!alive _bullet) || {(_bullet isKindOf "BulletBase") && {_bulletSpeedSqr < 10000}}) then {
            GVAR(trackedBullets) deleteAt (GVAR(trackedBullets) find _x);
        } else {
            if (_isWind) then {
                private _trueVelocity = _bulletVelocity vectorDiff wind;
                private _trueSpeed = vectorMagnitude _trueVelocity;

                private _dragRef = _deltaT * _airFriction * _bulletSpeedSqr;
                private _accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
                _bulletVelocity = _bulletVelocity vectorDiff _accelRef;

                private _drag = _deltaT * _airFriction * _trueSpeed;
                private _accel = _trueVelocity vectorMultiply (_drag);
                _bulletVelocity = _bulletVelocity vectorAdd _accel;
            };
            _bullet setVelocity _bulletVelocity;
        };
        nil
    } count +GVAR(trackedBullets);
    // END_COUNTER(pfeh);
}, GVAR(simulationInterval), [CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
