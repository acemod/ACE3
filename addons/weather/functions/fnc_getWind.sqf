/*
 * Author: ACE2 Team
 * Calculate current wind locally from the data broadcasted by the server
 *
 * Argument:
 * None
 *
 * Return value:
 * Wind <ARRAY>
 */
#include "script_component.hpp"
private ["_dir","_dirInc","_dirRange","_period","_periodPercent","_periodPosition","_return","_spd","_spdInc","_spdRange"];

_return = [0,0,0];
if(!isNil "ACE_WIND_PARAMS") then {
    _dir        =  ACE_WIND_PARAMS select 0;
    _dirRange   = (ACE_WIND_PARAMS select 1) - (ACE_WIND_PARAMS select 0);
    _spd        =  ACE_WIND_PARAMS select 2;
    _spdRange   = (ACE_WIND_PARAMS select 3) - (ACE_WIND_PARAMS select 2);
    _period     =  ACE_WIND_PARAMS select 4;

    _periodPosition = (time - GVAR(wind_period_start_time)) min _period;
    _periodPercent = _periodPosition/_period;
    _spdInc = _spdRange * _periodPercent;
    _dirInc = _dirRange * _periodPercent;
    _spd = (_spd + _spdInc);
    _dir = _dir + _dirInc;
    if (_dir > 360) then {_dir = _dir - 360};
    if (_dir < 0) then {_dir = _dir + 360};

    _return = [_spd * sin _dir, _spd * cos _dir, 0];
};
_return;