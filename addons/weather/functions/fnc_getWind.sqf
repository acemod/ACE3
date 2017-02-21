/*
 * Author: ACE2 Team, Ruthberg
 * Calculate current wind locally from the data broadcasted by the server
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Wind <ARRAY>
 *
 * Example:
 * [] call ace_weather_fnc_getWind
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNil "ACE_WIND_PARAMS") exitWith { [0, 0, 0] };

ACE_WIND_PARAMS params ["_dir", "_dirChange", "_spd", "_spdChange", "_period"];
//Wind _dir is the "source" of the wind [eg: "northerly wind": _dir = 0 -> wind = [0,-1,0];]

private _periodPosition = (CBA_missionTime - GVAR(wind_period_start_time)) min _period;
private _periodPercent = _periodPosition / _period;

_spd = _spd + _spdChange * _periodPercent;
_dir = _dir + _dirChange * _periodPercent;

_dir = (360 + _dir) % 360;

TRACE_1("PeriodStartTime",Round(GVAR(wind_period_start_time)));
TRACE_2("Dir: Current/Change",Round(_dir),Round(_dirChange));
TRACE_2("Spd: Current/Change",Round(_spd * 10) / 10,Round(_spdChange * 10) / 10);
TRACE_3("Period/Position/Percent",Round(_period),Round(_periodPosition),Round(_periodPercent * 100) / 100);

// TODO: Add some deterministic noise

[-_spd * sin(_dir), -_spd * cos(_dir), 0]
