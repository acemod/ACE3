/*
 * Author: ACE2 Team, esteldunedain, ruthberg
 *
 * Updates the wind and rain evolution on the server. Broadcasts the current and next values to the clients
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_overcastMultiplier", "_lastRain", "_rainOverCast", "_transitionTime", "_windDirectionVariance", "_windSpeed", "_windSpeedChange", "_windMaxDiff", "_windMinDiff", "_windDirection", "_windDirectionChange", "_ratioMin", "_ratioMax"];

_overcastMultiplier = 1 max (2* overcast) min 2; // 0 (@ overcast 0), 2 (@ overcast 1)

// Rain simulation
if (GVAR(syncRain) && GVAR(rain_period_count) > GVAR(rain_next_period)) then {

    GVAR(rain_next_period) = ceil((1 + (random 10)) / _overcastMultiplier);
    GVAR(rain_period_count) = 0;
    
    _lastRain = GVAR(current_rain);
    
    if (overcast >= 0.7) then {
        _rainOverCast = (overcast - 0.7) / 0.3;
        if (GVAR(current_rain) == 0) then {
            // Initialize rain with a random strength depending on the current overcast value
            GVAR(current_rain) = 0.25 + (random 0.25) + (random 0.5) * _rainOverCast;
        };
        
        GVAR(current_rain) = GVAR(current_rain) + GVAR(current_rain) * ((_rainOverCast * _overcastMultiplier) / 8) * GVAR(rain_current_range);
        GVAR(current_rain) = 0.01 max GVAR(current_rain) min 1;
        
        GVAR(rain_current_range) = -1 + (random 2);
    } else {
        _rainOverCast = 1;
        
        GVAR(current_rain) = 0;
    };
    
    _transitionTime = 1 + (_rainOverCast * 5) + (random (_rainOverCast * 20));
    
    ACE_RAIN_PARAMS = [_lastRain, GVAR(current_rain), _transitionTime];
    TRACE_4("",_lastRain,_rainOverCast,_transitionTime,overcast);

    GVAR(rain_period_start_time) = time;
    publicVariable "ACE_RAIN_PARAMS";
};

// Wind simulation
if (GVAR(syncWind) && GVAR(wind_period_count) > GVAR(wind_next_period)) then {
    
    GVAR(wind_next_period) = ceil((2 + (random 5)) / _overcastMultiplier);
    GVAR(wind_period_count) = 0;
    
    _windDirectionVariance = (90 - (random 180)) * (overcast ^ 2);
    _windDirection = (360 + GVAR(wind_direction_reference) + _windDirectionVariance) % 360;
    _windDirectionChange = _windDirection - GVAR(current_wind_direction);
    if (_windDirectionChange > 180) then {
        _windDirectionChange = _windDirectionChange - 360;
    };
    if (_windDirectionChange < -180) then {
        _windDirectionChange = 360 + _windDirectionChange;
    };
    
    _windMaxDiff = GVAR(mean_wind_speed) - GVAR(max_wind_speed);
    _windMinDiff = GVAR(min_wind_speed) - GVAR(mean_wind_speed);
    
    _ratioMax = (random 1) ^ 2;
    _ratioMin = (random 1) ^ 2;
    
    _windSpeed = GVAR(current_wind_speed);
    _windSpeedChange = 0;
    if ((random 1) < (0.3 max overcast)) then {
        _windSpeed = GVAR(mean_wind_speed) + _windMaxDiff * _ratioMax + _windMinDiff * _ratioMin;
        _windSpeedChange = _windSpeed - GVAR(current_wind_speed);
    };
    
    _transitionTime = GVAR(wind_next_period) * GVAR(serverUpdateInterval);
    
    TRACE_5("dirCur/dirNew/spdCur/spdNew/period",GVAR(current_wind_direction),_windDirection,GVAR(current_wind_speed),_windSpeed,_transitionTime);
    
    ACE_WIND_PARAMS = [GVAR(current_wind_direction),
                        _windDirectionChange,
                       GVAR(current_wind_speed),
                       _windSpeedChange,
                       _transitionTime];
    
    GVAR(current_wind_direction) = _windDirection;
    GVAR(current_wind_speed) = _windSpeed;
    
    GVAR(wind_period_start_time) = time;
    publicVariable "ACE_WIND_PARAMS";
};


if (GVAR(syncMisc)) then {
    ACE_MISC_PARAMS = [lightnings, rainbow, fogParams, GVAR(temperatureShift), GVAR(badWeatherShift), GVAR(humidityShift)];
    publicVariable "ACE_MISC_PARAMS";
};

GVAR(rain_period_count) = GVAR(rain_period_count) + 1;
GVAR(wind_period_count) = GVAR(wind_period_count) + 1;