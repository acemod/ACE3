#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Toggle speed limiter for Driver in Plane. Uses a simple PID controller to manage thrust
 *
 * Arguments:
 * 0: Driver <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Preserve Speed Limit <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car] call ace_vehicles_fnc_autoThrottle
 *
 * Public: No
 */
#define PROPORTIONAL 4.00
#define INTEGRAL 0.60
#define DERIVATIVE 2.50
#define HISTORY_LENGTH (60 * 3)
#define BIG_NUMBER (1e30)
#define EPSILON 0.001

params ["_driver", "_vehicle", ["_preserveSpeedLimit", false]];

if (GVAR(isSpeedLimiter)) exitWith {
    [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    GVAR(isSpeedLimiter) = false;
};

[localize LSTRING(On)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;
GVAR(isCruiseControl) = true; // enables SET/RESUME

private _speedLimitMS = ((velocityModelSpace _vehicle) select 1) max (5 / 3.6);
if (!_preserveSpeedLimit) then {
    // Convert forward speed to KM/H. `speed _vehicle` isnt accurate enough for this controller to work well, so its easier to use M/S. The system assumes it is KM/H so we need the conversion
    GVAR(speedLimit) = _speedLimitMS * 3.6;
};

private _pid = [PROPORTIONAL, INTEGRAL, DERIVATIVE, _speedLimitMS, -BIG_NUMBER, BIG_NUMBER, HISTORY_LENGTH] call CBA_pid_fnc_create;

private _config = configOf _vehicle;
private _thrustLogFactor = getNumber (_config >> "throttleToThrustLogFactor");
if (_thrustLogFactor == 0) then {
    _thrustLogFactor = 1;
};
private _maxSpeed = getNumber (_config >> "maxSpeed");
private _thrustCoefs = getArray (_config >> "thrustCoef");
private _acceleration = getNumber (_config >> "acceleration");
if (_acceleration == 0) then {
    _acceleration = 100;
};

if (_thrustCoefs isEqualTo []) then {
    _thrustCoefs = [1];
};
private _thrustCoefsAdjustment = 150 / count _thrustCoefs;

private _airData = [_thrustLogFactor, _maxSpeed, _acceleration, _thrustCoefs, _thrustCoefsAdjustment];

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle", "_pid", "_airData", "_lastThrottleValue"];
    _airData params ["_throttleLogValue", "_maxSpeed", "_acceleration", "_thrustCoefs", "_thrustCoefsAdjustment"];

    private _role = _driver call EFUNC(common,getUavControlPosition);
    if (GVAR(isUAV)) then {
        if (_role != "DRIVER") then {
            GVAR(isSpeedLimiter) = false;
        };
    } else {
        if (_driver != currentPilot _vehicle || {_role != ""}) then {
            GVAR(isSpeedLimiter) = false;
        };
    };

    if (_throttleLogValue == 0) then {
        _throttleLogValue = 1;
    };

    private _currentThrottle = (airplaneThrottle _vehicle) ^ _throttleLogValue;
    if (_lastThrottleValue != -1 && { EPSILON < abs (_currentThrottle - _lastThrottleValue) }) then {
        // player/script has moved throttle, stop limiting speed
        // ARMA will allow an increment of one throttle unit per frame, so if there is a difference between our known throttle value and actual throttle value, the player must of changed it
        [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
        playSound "ACE_Sound_Click";
        GVAR(isSpeedLimiter) = false;
    };

    if (call CBA_fnc_getActiveFeatureCamera != "") then {
        GVAR(isSpeedLimiter) = false;
    };

    if (!GVAR(isSpeedLimiter)) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    private _setpoint = _pid getVariable "CBA_pid_setpoint";
    if (abs ((GVAR(speedLimit) / 3.6) - _setpoint) > EPSILON) then {
        [_pid, GVAR(speedLimit) / 3.6] call CBA_pid_fnc_setpoint;
    };
    private _velocity = (velocityModelSpace _vehicle) select 1;
    private _percentMaxSpeed = _velocity / _maxSpeed;
    private _coefIdxBase = floor (100 * _percentMaxSpeed / _thrustCoefsAdjustment);
    private _coefIdxNext = _coefIdxBase + 1;
    _percentMaxSpeed = _percentMaxSpeed - floor _percentMaxSpeed;

    private _thrustCoefBase = 1;
    private _thrustCoefNext = 1;
    if (_coefIdxBase < count _thrustCoefs) then {
        _coefIdxNext = _coefIdxNext min (-1 + count _thrustCoefs);
        _thrustCoefBase = _thrustCoefs select _thrustCoefBase;
        _thrustCoefNext = _thrustCoefs select _thrustCoefNext;
    };

    private _thrustCoef = linearConversion [0, 1, _percentMaxSpeed, _thrustCoefBase, _thrustCoefNext];
    private _availableAcceleration = _thrustCoef * _acceleration;
    private _currentAcceleration = _currentThrottle * _availableAcceleration;

    private _velocityCommand = [_pid, _velocity] call CBA_pid_fnc_update;
    private _throttle = 1 min (0 max (_currentThrottle + _velocityCommand / _availableAcceleration));
    
    _vehicle setAirplaneThrottle _throttle;
    _args set [4, _throttle];

}, 0, [_driver, _vehicle, _pid, _airData, -1]] call CBA_fnc_addPerFrameHandler;

