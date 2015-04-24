/*
 * Author: ACE2 Team
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

private ["_oldStrength", "_rainStrength", "_transitionTime", "_periodPosition", "_periodPercent"];

if (!isNil "ACE_RAIN_PARAMS" && {!isNil QGVAR(rain_period_start_time)}) then {
    _oldStrength = ACE_RAIN_PARAMS select 0;
    _rainStrength = ACE_RAIN_PARAMS select 1;
    _transitionTime = ACE_RAIN_PARAMS select 2;
    _periodPosition = (time - GVAR(rain_period_start_time)) min _transitionTime;
    _periodPercent = (_periodPosition/_transitionTime) min 1;

    0 setRain ((_periodPercent*(_rainStrength-_oldStrength))+_oldStrength);
};
