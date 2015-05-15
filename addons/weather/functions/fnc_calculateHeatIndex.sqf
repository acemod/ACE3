/*
 * Author: Ruthberg
 *
 * Calculates heat index based on temperature and humidity
 *
 * Arguments:
 * 0: temperature - degrees celcius <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * 0: heat index <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_t, _rh);

_rh = _rh * 100; // relative humidity in %

// Source: https://en.wikipedia.org/wiki/Heat_index
(__C1 + __C2 * _t + __C3 * _rh + __C4 * _t * _rh + __C5 * _t^2 + __C6 * _rh^2 + __C7 * _t^2 * _rh + __C8 * _t * _rh^2 + __C9 * _t^2 * _rh^2)
