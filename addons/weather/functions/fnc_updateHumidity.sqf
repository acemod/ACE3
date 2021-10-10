#include "script_component.hpp"
/*
 * Author: ACE2 Team
 * Smoothly updates GVAR(currentHumidity) on the server (based on time of day and map data)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateHumidity
 *
 * Public: No
 */

if (rain > 0 && overcast > 0.7) then {
    GVAR(currentHumidity) = 1;
} else {
    private _month = date select 1;
    GVAR(currentHumidity) = (GVAR(Humidity) select (_month - 1)) / 100;
    GVAR(currentHumidity) = GVAR(currentHumidity) + GVAR(humidityShift);
    private _avgTemperature = ((GVAR(TempDay) select (_month - 1)) + (GVAR(TempNight) select (_month - 1))) / 2;
    private _pS1 = 6.112 * exp((17.62 * _avgTemperature) / (243.12 + _avgTemperature));
    private _PS2 = 6.112 * exp((17.62 * GVAR(currentTemperature)) / (243.12 + GVAR(currentTemperature)));
    GVAR(currentHumidity) = GVAR(currentHumidity) * _PS1 / _PS2;
};

GVAR(currentHumidity) = 0 max GVAR(currentHumidity) min 1;

publicVariable QGVAR(currentHumidity);
