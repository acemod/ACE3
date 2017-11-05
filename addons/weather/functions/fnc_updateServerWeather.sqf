/*
 * Author: ACE2 Team, esteldunedain, Ruthberg
 * Updates the wind evolution on the server. Broadcasts relevant weather information to the clients.
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

missionNamespace setVariable [QGVAR(currentOvercast), overcast, true];

// Wind simulation
if (GVAR(wind_period_count) > GVAR(wind_next_period)) then {

    private _overcastMultiplier = 1 max (2* overcast) min 2; // 0 (@ overcast 0), 2 (@ overcast 1)
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

GVAR(wind_period_count) = GVAR(wind_period_count) + 1;
