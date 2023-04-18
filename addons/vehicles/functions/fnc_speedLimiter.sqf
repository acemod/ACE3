#include "script_component.hpp"
/*
 * Author: commy2
 * Toggle speed limiter for Driver in Vehicle.
 *
 * Arguments:
 * 0: Driver <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Cruise Control <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car, true] call ace_vehicles_fnc_speedLimiter
 *
 * Public: No
 */

params ["_driver", "_vehicle", ["_cruiseControl", false]];

if (GVAR(isSpeedLimiter)) exitWith {
    switch ([GVAR(isCruiseControl), _cruiseControl]) do {
        case [true, true]: {
            [localize LSTRING(OffCruise)] call EFUNC(common,displayTextStructured);
            playSound "ACE_Sound_Click";
            _vehicle setCruiseControl [0, false];
            GVAR(isSpeedLimiter) = false;
            GVAR(isCruiseControl) = false;
        };
        case [true, false]: {
            [localize LSTRING(On)] call EFUNC(common,displayTextStructured);
            playSound "ACE_Sound_Click";
            _vehicle setCruiseControl [GVAR(speedLimit), false];
            GVAR(isCruiseControl) = false;
        };
        case [false, true]: {
            [localize LSTRING(OnCruise)] call EFUNC(common,displayTextStructured);
            playSound "ACE_Sound_Click";
            _vehicle setCruiseControl [GVAR(speedLimit), true];
            GVAR(isCruiseControl) = true;
        };
        case [false, false]: {
            [localize LSTRING(Off)] call EFUNC(common,displayTextStructured);
            playSound "ACE_Sound_Click";
            _vehicle setCruiseControl [0, false];
            GVAR(isSpeedLimiter) = false;
        };
    };
};

(getCruiseControl _vehicle) params ["_speedLimit"];
if (_speedLimit != 0) exitWith { TRACE_1("speed limit set by external source",_speedLimit); };

[localize (
    [LSTRING(On), LSTRING(OnCruise)] select _cruiseControl
)] call EFUNC(common,displayTextStructured);
playSound "ACE_Sound_Click";
GVAR(isSpeedLimiter) = true;
GVAR(isCruiseControl) = _cruiseControl;

GVAR(speedLimit) = round (speed _vehicle max 5);
GVAR(speedLimitInit) = true;

[{
    params ["_args", "_idPFH"];
    _args params ["_driver", "_vehicle"];

    if (GVAR(isUAV)) then {
        private _uavControl = UAVControl _vehicle;
        if ((_uavControl select 0) != _driver || _uavControl select 1 != "DRIVER") then {
            GVAR(isSpeedLimiter) = false;
            TRACE_1("UAV driver changed, disabling speedlimit",_vehicle);
            _vehicle setCruiseControl [0, false];
        };
    } else {
        if (_driver != driver _vehicle) then {
            GVAR(isSpeedLimiter) = false;
            TRACE_3("Vehicle driver changed, disabling speedlimit",_driver,driver _vehicle,_vehicle);
            _vehicle setCruiseControl [0, false];
        };
    };

    if (!GVAR(isSpeedLimiter)) exitWith {
        _vehicle setCruiseControl [0, false];
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };

    getCruiseControl _vehicle params ["_currentSpeedLimit", "_cruiseControlActive"];
    if (GVAR(isCruiseControl) && {!GVAR(speedLimitInit) && {!_cruiseControlActive}}) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        GVAR(isSpeedLimiter) = false;
        [localize LSTRING(OffCruise)] call EFUNC(common,displayTextStructured);
        playSound "ACE_Sound_Click";
    };
    if (round _currentSpeedLimit != GVAR(speedLimit)) then {
        TRACE_2("Updating speed limit",GVAR(speedLimit),_vehicle);
        _vehicle setCruiseControl [GVAR(speedLimit), GVAR(isCruiseControl)];
        GVAR(speedLimitInit) = false;
    };
}, 0, [_driver, _vehicle]] call CBA_fnc_addPerFrameHandler;
