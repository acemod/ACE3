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

private ["_time", "_month", "_timeRatio"];
_time = daytime;
_month = date select 1;

_timeRatio = abs(_time - 12) / 12;

GVAR(currentTemperature) = (GVAR(TempDay) select (_month - 1)) * (1 - _timeRatio) + (GVAR(TempNight) select (_month - 1)) * _timeRatio;
GVAR(currentTemperature) = GVAR(currentTemperature) + GVAR(temperatureShift) - GVAR(badWeatherShift) * overcast;
GVAR(currentTemperature) = round(GVAR(currentTemperature) * 10) / 10;

TRACE_2("temperatureShift/badWeatherShift",GVAR(temperatureShift),GVAR(badWeatherShift));
