/*
 * Author: ACE2 Team, Ruthberg
 *
 * Updates rain based on ACE_RAIN_PARAMS
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

if (!GVAR(syncRain)) exitWith {};

if (!isNil "ACE_RAIN_PARAMS") then {
    EXPLODE_3_PVT(ACE_RAIN_PARAMS,_oldRain,_newRain,_period);
    
    private ["_periodPosition", "_periodPercent"];
    _periodPosition = (ACE_time - GVAR(rain_period_start_time)) min _period;
    _periodPercent = (_periodPosition / _period) min 1;

    GVAR(ACE_Rain) = (_oldRain + (_newRain - _oldRain) * _periodPercent);
};
