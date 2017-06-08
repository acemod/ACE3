/*
 * Author: ACE2 Team, Ruthberg
 * Updates rain based on ACE_RAIN_PARAMS
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateRain
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isNil "ACE_RAIN_PARAMS") then {
    ACE_RAIN_PARAMS params ["_oldRain", "_newRain", "_period"];

    private _periodPosition = (CBA_missionTime - GVAR(rain_period_start_time)) min _period;
    private _periodPercent = (_periodPosition / _period) min 1;

    GVAR(ACE_Rain) = linearConversion [GVAR(rain_period_start_time), (GVAR(rain_period_start_time) + _period), CBA_missionTime, _oldRain, _newRain];

    TRACE_3("Update Rain",rain,ACE_RAIN_PARAMS,GVAR(ACE_Rain));
};
