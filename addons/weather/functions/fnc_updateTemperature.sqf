/*
 * Author: ACE2 Team
 *
 * Updates GVAR(currentTemperature) based on the map data
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

private ["_time", "_month", "_hourlyCoef"];
_time = daytime;
_month = date select 1;

_hourlyCoef = -0.5 * sin(360 * ((3 + (date select 3))/24 + (date select 4)/1440));

GVAR(currentTemperature) = (GVAR(TempDay) select (_month - 1)) * (1 - _hourlyCoef) + (GVAR(TempNight) select (_month - 1)) * _hourlyCoef;
GVAR(currentTemperature) = GVAR(currentTemperature) + GVAR(temperatureShift) - GVAR(badWeatherShift) * overcast;
GVAR(currentTemperature) = round(GVAR(currentTemperature) * 10) / 10;

TRACE_2("temperatureShift/badWeatherShift",GVAR(temperatureShift),GVAR(badWeatherShift));
