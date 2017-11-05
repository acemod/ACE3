/*
 * Author: ACE2 Team, Ruthberg
 * Smoothly updates wind on the server (based on time of year and map data)
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

if (isNil QGVAR(windParams)) exitWith {};

GVAR(windParams) params ["_dir", "_dirChange", "_spd", "_spdChange", "_period", "_wind_period_start_time"];

private _periodPosition = (CBA_missionTime - _wind_period_start_time) min _period;
private _periodPercent = _periodPosition / _period;

_spd = _spd + _spdChange * _periodPercent;
_dir = _dir + _dirChange * _periodPercent;

_dir = (360 + _dir) % 360;

TRACE_1("PeriodStartTime",Round(_wind_period_start_time));
TRACE_2("Dir: Current/Change",Round(_dir),Round(_dirChange));
TRACE_2("Spd: Current/Change",_spd toFixed 1,_spdChange toFixed 1);
TRACE_3("Period/Position/Percent",Round(_period),Round(_periodPosition),_periodPercent toFixed 2);

// TODO: Add some noise

setWind [-_spd * sin(_dir), -_spd * cos(_dir), true];
