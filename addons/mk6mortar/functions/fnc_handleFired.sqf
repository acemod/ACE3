/*
 * Author: PabstMirror
 * Called when the mortar is fired.
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
 * [clientFiredBIS-XEH] call ace_mk6mortar_fnc_handleFired
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

PARAMS_7(_vehicle,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if (!GVAR(airResistanceEnabled)) exitWith {};
// Large enough distance to not simulate any wind deflection
if (_unit distance ACE_player > 8000) exitWith {false};

//AI will have no clue how to use:
_shooterMan = gunner _vehicle;
if (!([_shooterMan] call EFUNC(common,isPlayer))) exitWith {false};

//Should be zero, just make sure:
_bisAirFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
if (_bisAirFriction != 0) exitWith {ERROR("Non zero base airFriction");};

//Hack Until these are intergrated:
if (isNil QEGVAR(weather,currentRelativeDensity)) then {
    EGVAR(weather,currentRelativeDensity) = 1;
};
if (isNil QEGVAR(weather,currentTemperature)) then {
    EGVAR(weather,currentTemperature) = 15;
};


//powder effects:
_temperature = EGVAR(weather,currentTemperature);
_newMuzzleVelocityCoefficent = (((_temperature + 273.13) / 288.13 - 1) / 40 + 1);
if (_newMuzzleVelocityCoefficent != 1) then {
    _bulletVelocity = velocity _projectile;
    _bulletSpeed = vectorMagnitude _bulletVelocity;
    _bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply (_bulletSpeed * _newMuzzleVelocityCoefficent);
    _projectile setVelocity _bulletVelocity;
    _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
};

systemChat format ["PFEH for %1", _ammo];

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

    _trueVelocity = _bulletVelocity vectorDiff ACE_wind;
    _trueSpeed = vectorMagnitude _trueVelocity;

    _drag = _deltaT * _airFriction * _trueSpeed * EGVAR(weather,currentRelativeDensity);
    _accel = _trueVelocity vectorMultiply (_drag);
    _bulletVelocity = _bulletVelocity vectorAdd _accel;

    _shell setVelocity _bulletVelocity;

}, 0, [_projectile, MK6_82mm_AIR_FRICTION, time]] call CBA_fnc_addPerFrameHandler;
