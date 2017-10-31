/*
 * Author: ACE2 Team, Ruthberg
 * Smoothly updates ACE_wind based on the server weather
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateWind
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNil "ACE_WIND_PARAMS") exitWith { ACE_wind = wind };

ACE_WIND_PARAMS params ["_dir", "_dirChange", "_spd", "_spdChange", "_period", "_wind_period_start_time"];

private _periodPosition = (CBA_missionTime - _wind_period_start_time) min _period;
private _periodPercent = _periodPosition / _period;

_spd = _spd + _spdChange * _periodPercent;
_dir = _dir + _dirChange * _periodPercent;

_dir = (360 + _dir) % 360;

TRACE_1("PeriodStartTime",Round(_wind_period_start_time));
TRACE_2("Dir: Current/Change",Round(_dir),Round(_dirChange));
TRACE_2("Spd: Current/Change",_spd toFixed 1,_spdChange toFixed 1);
TRACE_3("Period/Position/Percent",Round(_period),Round(_periodPosition),_periodPercent toFixed 2);

// TODO: Add some deterministic noise

ACE_wind = [-_spd * sin(_dir), -_spd * cos(_dir), 0];

TRACE_3("Wind/ACE_wind/Deviation(m/s)",wind,ACE_wind,(ACE_wind vectorDistance wind) toFixed 1);
