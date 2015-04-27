/*
 * Author: ACE2 Team, Ruthberg
 *
 * Calculate current wind locally from the data broadcasted by the server
 *
 * Argument:
 * None
 *
 * Return value:
 * Wind <ARRAY>
 */
#include "script_component.hpp"

if (isNil "ACE_WIND_PARAMS") exitWith { [0, 0, 0] };

EXPLODE_5_PVT(ACE_WIND_PARAMS,_dir,_dirChange,_spd,_spdChange,_period);

private ["_periodPercent", "_periodPosition"];
_periodPosition = (time - GVAR(wind_period_start_time)) min _period;
_periodPercent = _periodPosition / _period;

_spd = _spd + _spdChange * _periodPercent;
_dir = _dir + _dirChange * _periodPercent;

_dir = (360 + _dir) % 360;

TRACE_1("PeriodStartTime",Round(GVAR(wind_period_start_time)));
TRACE_2("Dir: Current/Change",Round(_dir),Round(_dirChange));
TRACE_2("Spd: Current/Change",Round(_spd * 10) / 10,Round(_spdChange * 10) / 10);
TRACE_3("Period/Position/Percent",Round(_period),Round(_periodPosition),Round(_periodPercent * 100) / 100);

// TODO: Add some deterministic noise

[-_spd * sin(_dir), -_spd * cos(_dir), 0]
