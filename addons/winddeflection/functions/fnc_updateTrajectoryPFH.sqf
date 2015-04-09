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
#include "script_component.hpp"

[{
    private ["_bullet", "_airFriction", "_args", "_deltaT", "_bulletVelocity", "_bulletSpeed", "_trueVelocity", "_trueVelocity", "_dragRef", "_drag", "_accelRef", "_accel"];

    _args = _this select 0;
    _bullet = _args select 0;
    _airFriction = _args select 1;
    _time = _args select 2;

    if (!alive _bullet) exitwith {
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };

    _deltaT = time - _time;
    _args set[2, time];

    _bulletVelocity = velocity _bullet;
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    if (vectorMagnitude ACE_wind > 0) then {
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
    
}, 0, [_this select 0, _this select 1, time]] call CBA_fnc_addPerFrameHandler;