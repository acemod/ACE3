/*
 * Author: Ruthberg
 *
 * Gather weather parameters and broadcast them to the clients
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

if (!GVAR(enableServerController)) exitWith {};

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
        ACE_WIND_PARAMS = [wind call CBA_fnc_vectDir, 0, vectorMagnitude wind, 0, GVAR(serverUpdateInterval)];
        publicVariable "ACE_WIND_PARAMS";
    };
    if (GVAR(syncMisc)) then {
        ACE_MISC_PARAMS = [lightnings, rainbow, fogParams, GVAR(temperatureShift), GVAR(badWeatherShift), GVAR(humidityShift)];
        publicVariable "ACE_MISC_PARAMS";
    };
};
