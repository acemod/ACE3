#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates dew point based on temperature and relative humidity
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * dew point <NUMBER>
 *
 * Example:
 * [32, 0.4] call ace_weather_fnc_calculateDewPoint
 *
 * Public: No
 */

#define __b 17.67
#define __c 243.5

params ["_t", "_rh"];

if (_rh == 0) exitWith { CELSIUS(0) };

// Source: https://en.wikipedia.org/wiki/Dew_point

private _gamma = ln(_rh) + (__b * _t) / (__c + _t);

(__c * _gamma) / (__b - _gamma)
