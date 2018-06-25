#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates heat index based on temperature and relative humidity
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * heat index <NUMBER>
 *
 * Example:
 * [36, 0.75] call ace_weather_fnc_calculateHeatIndex
 *
 * Public: No
 */

#define __C1 0.363445176
#define __C2 0.988622465
#define __C3 4.777114035
#define __C4 -0.114037667
#define __C5 -0.000850208
#define __C6 -0.020716198
#define __C7 0.000687678
#define __C8  0.000274954

params ["_t", "_rh"];

// Source: https://en.wikipedia.org/wiki/Heat_index

_t = TO_FAHRENHEIT(_t);
_rh = _rh * 100; // relative humidity in %

TO_CELSIUS(__C1 + __C2 * _t + __C3 * _rh + __C4 * _t * _rh + __C5 * _t^2 + __C6 * _rh^2 + __C7 * _t^2 * _rh + __C8 * _t * _rh^2)
