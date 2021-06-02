#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Toggle speed limiter for Driver in Plane. Uses a simple PID controller to manage thrust
 *
 * Arguments:
 * 0: Driver <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car] call ace_vehicles_fnc_autoThrottle
 *
 * Public: No
 */
#define PID_P 1
#define PID_I 0.3
#define PID_D 0

params ["_driver", "_vehicle"];

if (GVAR(isSpeedLimiter)) exitWith {
    [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    GVAR(isSpeedLimiter) = false;
};

[localize LSTRING(On)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;

// Convert forward speed to KM/H. `speed _vehicle` isnt accurate enough for this controller to work well, so its easier to use M/S. The system assumes it is KM/H so we need the conversion
GVAR(speedLimit) = (((velocityModelSpace _vehicle) select 1) * 3.6) max 5;

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle", "_autothrottleParameters"];
    _autothrottleParameters params ["_lastVelocity", "_integralValue", "_lastTime"];

    // this will take into account game being pausesd
    private _deltaTime = CBA_missionTime - _lastTime;

    if (_driver != driver _vehicle) then {
        GVAR(isSpeedLimiter) = false;
    };

    if (!GVAR(isSpeedLimiter)) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    if (_deltaTime == 0) exitWith {};

    private _forwardVelocity = (velocityModelSpace _vehicle) select 1;
    // convert from KM/H to M/S
    private _velocityError = (GVAR(speedLimit) / 3.6) - _forwardVelocity;

    // strictly speaking this would work better if this error was time to zero acceleration. I can't find the acceleration values in config, however, so this works instead
    private _errorDiff = _velocityError - _lastVelocity;

    private _p = PID_P * _velocityError;
    private _i = _integralValue + (PID_I * _errorDiff * _deltaTime);
    private _d = PID_D * _errorDiff / _deltaTime;

    private _outputBeforeSaturation = _p + _i + _d;
    private _throttle = 0 max (_outputBeforeSaturation min 1);

    // if we are saturated, we clamp the integral value to avoid integral windup
    if (_outputBeforeSaturation != _throttle) then {
        // saturated
        _i = _integralValue;
        _throttle = 0 max ((_p + _d) min 1);
    };

    _vehicle setAirplaneThrottle _throttle;

    _autothrottleParameters set [0, _d];
    _autothrottleParameters set [1, _i];
    _autothrottleParameters set [2, CBA_missionTime];
    _args set [2, _autothrottleParameters];

}, 0, [_driver, _vehicle, [0, 0, CBA_missionTime]]] call CBA_fnc_addPerFrameHandler;

