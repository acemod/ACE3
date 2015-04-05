/*
 * Author: PabstMirror
 *
 * Arguments:
 * 0: mortar - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

PARAMS_7(_vehicle,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if (!GVAR(airResistanceEnabled)) exitWith {};

if (_unit distance ACE_player > 3000) exitWith {false}; // Large enough distance to not simulate any wind deflection.
if (!GVAR(EnableForAI) && !([_unit] call EFUNC(common,isPlayer))) exitWith {false};

//Hack Until these are intergrated:
if (isNil QEGVAR(weather,currentRelativeDensity)) then {
    EGVAR(weather,currentRelativeDensity) = 1;
};
if (isNil QEGVAR(weather,currentTemperature)) then {
    EGVAR(weather,currentTemperature) = 20;
};

//powder effects:
_temperature = EGVAR(weather,currentTemperature);
_newMuzzleVelocityCoefficent = (((_temperature + 273.13) / 288.13 - 1) / 30 + 1);
if (_newMuzzleVelocityCoefficent != 1) then {
    _bulletVelocity = velocity _projectile;
    systemChat format ["Start Vel: %1", _bulletVelocity];
    _bulletSpeed = vectorMagnitude _bulletVelocity;
    _bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply (_bulletSpeed * _newMuzzleVelocityCoefficent);
    systemChat format ["New Vel: %1", _bulletVelocity];
    _projectile setVelocity _bulletVelocity;
    _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
};


// if (_bullet isKindOf "BulletBase") then {
[{
    private ["_deltaT", "_bulletVelocity", "_bulletSpeed", "_trueVelocity", "_trueSpeed", "_dragRef", "_accelRef", "_drag", "_accel"];
    PARAMS_2(_args,_pfID);
    EXPLODE_3_PVT(_args,_shell,_airFriction,_time);

    if (isNull _shell || {!alive _shell}) exitwith {
        [_pfID] call cba_fnc_removePerFrameHandler;
    };

    _deltaT = time - _time;
    _args set[2, time];

    _bulletVelocity = velocity _shell;
    _bulletSpeed = vectorMagnitude _bulletVelocity;

    if (vectorMagnitude ACE_wind > 0) then {
        _trueVelocity = _bulletVelocity vectorDiff ACE_wind;
        _trueSpeed = vectorMagnitude _trueVelocity;

        // _dragRef = _deltaT * _airFriction * _bulletSpeed * _bulletSpeed;
        // _accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
        // _bulletVelocity = _bulletVelocity vectorDiff _accelRef;

        _drag = _deltaT * _airFriction * _trueSpeed * EGVAR(weather,currentRelativeDensity);
        _accel = _trueVelocity vectorMultiply (_drag);

        _bulletVelocity = _bulletVelocity vectorAdd _accel;
    };
    _shell setVelocity _bulletVelocity;
    // TODO expand with advanced ballistics functionality.

}, 0, [_projectile, MK6_82mm_AIR_FRICTION, time]] call CBA_fnc_addPerFrameHandler;
// };

