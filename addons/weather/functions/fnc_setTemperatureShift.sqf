#include "..\script_component.hpp"
/*
 * Author: OverlordZorn
 * Sets an additional temperature shift that is applied on top of the simulated temperature.
 * The shift can be applied instantly or transitioned linearly over time, similar to setOvercast.
 * Must be called on the server. Takes effect with the next weather update.
 * For an instant change, ace_weather_temperatureShiftAPI can also be set directly on the server (overwritten by an ongoing transition).
 *
 * Arguments:
 * 0: Temperature shift in degrees Celsius <NUMBER> (default: 0)
 * 1: Transition duration in seconds, less than 1 is instant <NUMBER> (default: 0)
 * 2: Unique identifier <STRING> (default: "")
 *
 * Return Value:
 * UID <STRING>
 *
 * Example:
 * [-5, 600] call ace_weather_fnc_setTemperatureShift
 *
 * Public: Yes
 */

if (!isServer) exitWith { "Only the server can call this function" };

params [["_target", 0, [0]], ["_duration", 0, [0]], ["_uid", "", [""]]];

if (isNil QGVAR(temperatureShiftAPIinProgress)) then {
    GVAR(temperatureShiftAPIinProgress) = createHashMap;
};
if (_uid == "") then {
    _uid = format ["#%1", count GVAR(temperatureShiftAPIinProgress)];
};

if (_duration < 1) then {
    GVAR(temperatureShiftAPIinProgress) set [_uid, _target];
} else {
    private _existing = GVAR(temperatureShiftAPIinProgress) get _uid;
    private _currentShift = if (isNil "_existing") then {
        0
    } else {
        _existing params ["_startTime", "_endTime", "_startShift", "_endShift"];
        linearConversion [_startTime, _endTime, CBA_missionTime, _startShift, _endShift, true]
    };
    GVAR(temperatureShiftAPIinProgress) set [_uid, [CBA_missionTime, CBA_missionTime + _duration, _currentShift, _target]];
};

_uid
