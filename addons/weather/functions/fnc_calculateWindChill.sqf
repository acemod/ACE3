#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates wind chill based on temperature and wind speed
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: wind speed - m/s <NUMBER>
 *
 * Return Value:
 * wind chill <NUMBER>
 *
 * Example:
 * [0, 10] call ace_weather_fnc_calculateWindChill
 *
 * Public: No
 */

params ["_t", "_v"];

// Source: https://en.wikipedia.org/wiki/Wind_chill

if (_t > 10) exitWith { _t };
if (_v < 1.39) exitWith { _t };

_v = _v * 3,6; // wind speed in km/h
(13.12 + 0.6215 * _t - 11.37 * _v ^ 0.16 + 0.3965 * _t * _v ^ 0.16)
