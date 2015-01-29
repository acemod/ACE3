/**
 * fnc HandleFired.
 * Handles wind deflection for projectiles.
 * Is expected to be triggered by the fired eventhandler from BI.
 *
 * Params:
 *   1. unit: Object - Object the event handler is assigned to
 *   2. weapon: String - Fired weapon
 *   3. muzzle: String - Muzzle that was used
 *   4. mode: String - Current mode of the fired weapon
 *   5. ammo: String - Ammo used
 *   6. magazine: String - magazine name which was used
 *   7. projectile: Object - Object of the projectile that was shot (Arma 2: OA and onwards)
 *
 * Author: Glowbal, Ruthberg
 *
 */

#include "script_component.hpp"

private ["_unit", "_weapon", "_ammo", "_bullet", "_airFriction", "_index"];
_unit = _this select 0;

if (_unit distance ACE_player > 3000) exitWith {false}; // Large enough distance to not simulate any wind deflection.
if (!GVAR(EnableForAI) && !([_unit] call EFUNC(common,isPlayer))) exitWith {false};
_bullet = _this select 6;

if (_bullet isKindOf "BulletBase") then {
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
        // TODO expand with advanced ballistics functionality.

    }, 0, [_bullet, getNumber(configFile >> "cfgAmmo" >> (_this select 4) >> "airFriction"), time]] call CBA_fnc_addPerFrameHandler;
};
true;