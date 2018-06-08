/*
 * Author: commy2
 * Toggle speed limiter for Driver in Vehicle.
 *
 * Arguments:
 * 0: Driver <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car] call ace_vehicles_fnc_speedLimiter
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_driver", "_vehicle"];

if (GVAR(isSpeedLimiter)) exitWith {
    [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    GVAR(isSpeedLimiter) = false;
};

[localize LSTRING(On)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;

GVAR(speedLimit) = speed _vehicle max 5;

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle"];

    if (GVAR(isUAV)) then {
        private _uavControll = UAVControl _vehicle;
        if ((_uavControll select 0) != _driver || _uavControll select 1 != "DRIVER") then {
            GVAR(isSpeedLimiter) = false;
        };
    } else {
        if (_driver != driver _vehicle) then {
            GVAR(isSpeedLimiter) = false;
        };
    };

    if (!GVAR(isSpeedLimiter)) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    private _speed = speed _vehicle;

    if (_speed > GVAR(speedLimit)) then {
        _vehicle setVelocity ((velocity _vehicle) vectorMultiply ((GVAR(speedLimit) / _speed) - 0.00001));  // fix 1.42-hotfix PhysX libraries applying force in previous direction when turning
    };

}, 0, [_driver, _vehicle]] call CBA_fnc_addPerFrameHandler;
