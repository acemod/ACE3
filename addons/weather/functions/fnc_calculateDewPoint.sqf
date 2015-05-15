/*
 * Author: Ruthberg
 *
 * Calculates dew point based on temperature and relative humidity
 *
 * Arguments:
 * 0: temperature - degrees celcius <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * 0: dew point <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

#define __b 17.67
#define __c 243.5

PARAMS_2(_t,_rh);

// Source: https://en.wikipedia.org/wiki/Dew_point
private ["_gamma"];
_gamma = ln(_rh) + (__b * _t) / (__c + _t);

(__c * _gamma) / (__b - _gamma)
