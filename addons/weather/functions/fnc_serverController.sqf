/*
 * Author: Ruthberg
 * Gather weather parameters and broadcast them to the clients
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_serverController
 *
 * Public: No
 */
#include "script_component.hpp"

if (GVAR(useACEWeather)) then {
    // Use location based real world weather data
    [] call FUNC(updateAceWeather);
} else {
    // Simply replicate the server weather on the clients
    if (GVAR(syncRain)) then {
        ACE_RAIN_PARAMS = [rain, rain, GVAR(serverUpdateInterval)];
        publicVariable "ACE_RAIN_PARAMS";
    };
    if (GVAR(syncWind)) then {
        //Wind _dir is the "source" of the wind [eg: "northerly wind": _dir = 0 -> wind = [0,-1,0];]
        private _windDir = ((((wind select 0) atan2 (wind select 1)) + 180) % 360);
        ACE_WIND_PARAMS = [_windDir, 0, vectorMagnitude wind, 0, GVAR(serverUpdateInterval)];
        publicVariable "ACE_WIND_PARAMS";
    };
    if (GVAR(syncMisc)) then {
        ACE_MISC_PARAMS = [lightnings, rainbow, fogParams, GVAR(temperatureShift), GVAR(badWeatherShift), GVAR(humidityShift)];
        publicVariable "ACE_MISC_PARAMS";
    };
};
