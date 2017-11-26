/*
 * Author: ACE2 Team
 * Smoothly updates GVAR(currentTemperature) on the server (based on time of day and map data)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_weather_fnc_updateTemperature
 *
 * Public: No
 */
#include "script_component.hpp"

private _month = date select 1;
private _timeRatio = abs(daytime - 12) / 12;

GVAR(currentTemperature) = (GVAR(TempDay) select (_month - 1)) * (1 - _timeRatio) + (GVAR(TempNight) select (_month - 1)) * _timeRatio;
GVAR(currentTemperature) = GVAR(currentTemperature) + GVAR(temperatureShift) - GVAR(badWeatherShift) * GVAR(currentOvercast);
GVAR(currentTemperature) = round(GVAR(currentTemperature) * 10) / 10;

publicVariable QGVAR(currentTemperature);
