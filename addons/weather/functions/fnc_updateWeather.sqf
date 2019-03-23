#include "script_component.hpp"
/*
 * Author: ACE2 Team, esteldunedain, Ruthberg
 * Updates the weather evolution on the server. Broadcasts relevant weather information to the clients.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateWeather
 *
 * Public: No
 */

missionNamespace setVariable [QGVAR(currentOvercast), overcast, true];

[] call FUNC(updateTemperature);
[] call FUNC(updateHumidity);

// Wind simulation
if (GVAR(windSimulation) && CBA_missionTime > GVAR(next_wind_udpate)) then {

    GVAR(current_wind_direction) = GVAR(next_wind_direction);
    GVAR(current_wind_speed) = GVAR(next_wind_speed);

    private _transitionPeriod = GVAR(updateInterval) * (2 + (random 4)) / (1 + overcast);
    GVAR(next_wind_udpate) = CBA_missionTime + _transitionPeriod;

    private _windDirectionVariance = (90 - (random 180)) * (overcast ^ 2);
    GVAR(next_wind_direction) = (360 + GVAR(wind_direction_reference) + _windDirectionVariance) % 360;

    if ((random 1) < (0.3 max overcast)) then {
        private _speedVariance = GVAR(wind_upper_span) * (random 1) ^ 2 + GVAR(wind_lower_span) * (random 1) ^ 2;
        GVAR(next_wind_speed) = GVAR(mean_wind_speed) + _speedVariance;
    };

    GVAR(last_wind_update) = CBA_missionTime;

    TRACE_5("dirCur/dirNew/spdCur/spdNew/period",GVAR(current_wind_direction),GVAR(next_wind_direction),GVAR(current_wind_speed),GVAR(next_wind_speed),_transitionPeriod);
};
