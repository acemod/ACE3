#include "script_component.hpp"
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

params ["_driver", "_vehicle"];

if (GVAR(isSpeedLimiter)) exitWith {
    [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
    playSound "ACE_Sound_Click";
    _vehicle setCruiseControl [0, false];
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
            _vehicle setCruiseControl [0, false];
        };
    } else {
        if (_driver != driver _vehicle) then {
            GVAR(isSpeedLimiter) = false;
            _vehicle setCruiseControl [0, false];
        };
    };

    if (!GVAR(isSpeedLimiter)) exitWith {
        _vehicle setCruiseControl [0, false];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    _vehicle setCruiseControl [GVAR(speedLimit), false];

    private _speed = speed _vehicle;

}, 0, [_driver, _vehicle]] call CBA_fnc_addPerFrameHandler;
