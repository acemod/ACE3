/*
 * Author: ACE2 Team, esteldunedain, Ruthberg
 * Updates the wind and rain evolution on the server. Broadcasts the current and next values to the clients where needed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateServerWeather
 *
 * Public: No
 */
#include "script_component.hpp"

private _overcastMultiplier = 1 max (2* overcast) min 2; // 0 (@ overcast 0), 2 (@ overcast 1)

// Rain simulation
if (GVAR(rain_period_count) > GVAR(rain_next_period)) then {

    GVAR(rain_next_period) = ceil((1 + (random 10)) / _overcastMultiplier);
    GVAR(rain_period_count) = 0;

    private _rainOverCast = 0;

    if (overcast >= 0.7) then {
        _rainOverCast = (overcast - 0.7) / 0.3;
        if (GVAR(next_rain) == 0) then {
            // Initialize rain with a random strength depending on the current overcast value
            GVAR(next_rain) = -0.25 + (random 0.75) + (random 0.5) * _rainOverCast;
        };

        private _rain_current_range = -1 + (random 2);
        
        GVAR(next_rain) = GVAR(next_rain) + GVAR(next_rain) * ((_rainOverCast * _overcastMultiplier) / 8) * _rain_current_range;
        GVAR(next_rain) = 0 max GVAR(next_rain) min 1;
    } else {
        _rainOverCast = 1;
        GVAR(next_rain) = 0;
    };

    private _rain_transition_time = 1 + (_rainOverCast * 5) + (random (_rainOverCast * 20));
    
    _rain_transition_time setRain GVAR(next_rain);
    
    TRACE_5("",rain,GVAR(next_rain),_rain_transition_time,_rainOverCast,overcast);
};

// Wind simulation
if (GVAR(wind_period_count) > GVAR(wind_next_period)) then {

    GVAR(wind_next_period) = ceil((2 + (random 5)) / _overcastMultiplier);
    GVAR(wind_period_count) = 0;

    private _windDirectionVariance = (90 - (random 180)) * (overcast ^ 2);
    private _windDirection = (360 + GVAR(wind_direction_reference) + _windDirectionVariance) % 360;
    private _windDirectionChange = _windDirection - GVAR(current_wind_direction);
    if (_windDirectionChange > 180) then {
        _windDirectionChange = _windDirectionChange - 360;
    };
    if (_windDirectionChange < -180) then {
        _windDirectionChange = 360 + _windDirectionChange;
    };

    private _windMaxDiff = GVAR(mean_wind_speed) - GVAR(max_wind_speed);
    private _windMinDiff = GVAR(min_wind_speed) - GVAR(mean_wind_speed);

    private _ratioMax = (random 1) ^ 2;
    private _ratioMin = (random 1) ^ 2;

    private _windSpeed = GVAR(current_wind_speed);
    private _windSpeedChange = 0;
    if ((random 1) < (0.3 max overcast)) then {
        _windSpeed = GVAR(mean_wind_speed) + _windMaxDiff * _ratioMax + _windMinDiff * _ratioMin;
        _windSpeedChange = _windSpeed - GVAR(current_wind_speed);
    };

    private _transitionTime = GVAR(wind_next_period) * GVAR(updateInterval);

    TRACE_5("dirCur/dirNew/spdCur/spdNew/period",GVAR(current_wind_direction),_windDirection,GVAR(current_wind_speed),_windSpeed,_transitionTime);

    ACE_WIND_PARAMS = [GVAR(current_wind_direction), _windDirectionChange, GVAR(current_wind_speed), _windSpeedChange, _transitionTime, CBA_missionTime];

    GVAR(current_wind_direction) = _windDirection;
    GVAR(current_wind_speed) = _windSpeed;

    publicVariable "ACE_WIND_PARAMS";
};

missionNamespace setVariable [QGVAR(currentOvercast), overcast, true];

GVAR(rain_period_count) = GVAR(rain_period_count) + 1;
GVAR(wind_period_count) = GVAR(wind_period_count) + 1;
