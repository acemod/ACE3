/*
 * Author: ACE2 Team, esteldunedain, ruthberg
 *
 * Calculate the wind and rain evolution on the server. Broadcasts the current and next values to the clients
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_i", "_lastRain", "_rainOverCast", "_transitionTime", "_windDirectionVariance", "_windDirection", "_time", "_c1", "_c2", "_c3", "_c4"];

// Rain simulation
if(GVAR(rain_period_count) > GVAR(rain_next_period)) then {

    if(overcast >= 0.7) then {
        _lastRain = GVAR(current_rain);
        _rainOverCast = ((overcast-0.7)/0.3);
        GVAR(rain_next_period) = ceil((1+random(10))/GVAR(overcast_multiplier));

        GVAR(current_rain) = (GVAR(current_rain)+(((GVAR(current_rain)))*((_rainOverCast*(GVAR(overcast_multiplier)))/8)*GVAR(rain_current_range)));
        GVAR(current_rain) = (GVAR(current_rain) max 0.01) min 1;

        _transitionTime = (_rainOverCast*5)+(random (_rainOverCast*20))+1;
        GVAR(rain_current_range) = -1+(random 2);

        ACE_RAIN_PARAMS = [_lastRain, GVAR(current_rain), _transitionTime];
        TRACE_4("",_lastRain,_rainOverCast,_transitionTime, overcast);
    } else {
        GVAR(current_rain) = 0;
        _lastRain = GVAR(current_rain);
        _rainOverCast = 1;
        _transitionTime = (_rainOverCast*5)+(random (_rainOverCast*20))+1;

        ACE_RAIN_PARAMS = [_lastRain, GVAR(current_rain), _transitionTime];
        TRACE_4("",_lastRain,_rainOverCast,_transitionTime, overcast);
    };

    GVAR(rain_period_start_time) = time;
    publicVariable "ACE_RAIN_PARAMS";
};

// Wind simulation
if(GVAR(wind_period_count) > GVAR(wind_next_period)) then {
    
    GVAR(wind_next_period) = ceil((2 + (random 5)) / GVAR(overcast_multiplier));
    GVAR(wind_period_count) = 0;
    
    _windDirectionVariance = (90 - (random 180)) * overcast;
    _windDirection = (360 + GVAR(wind_direction_reference) + _windDirectionVariance) % 360;
    
    _c1 = (0.1 + random 0.1) * overcast;
    _c2 = (0.2 + random 0.1) * overcast;
    _c3 = (0.5 + random 0.2);
    _c4 = (0.7 + random 0.2);
    
    _time = GVAR(wind_next_period) * 60;
    
    ACE_WIND_PARAMS = [_windDirection,
                       GVAR(min_wind_speed),
                       GVAR(max_wind_speed),
                       _c1,
                       _c2,
                       _c3,
                       _c4,
                       _time];
                       
    GVAR(wind_period_start_time) = time;
    publicVariable "ACE_WIND_PARAMS";
};

// Sync misc. parameters
ACE_MISC_PARAMS = [lightnings, rainbow, fogParams];
publicVariable "ACE_MISC_PARAMS";

GVAR(rain_period_count) = GVAR(rain_period_count) + 1;
GVAR(wind_period_count) = GVAR(wind_period_count) + 1;