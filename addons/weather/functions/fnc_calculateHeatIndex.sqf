/*
 * Author: Ruthberg
 *
 * Calculates heat index based on temperature and relative humidity
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

#define __C1 -8.784695
#define __C2 1.61139411
#define __C3 2.338549
#define __C4 -0.14611605
#define __C5 -0.012308094
#define __C6 -0.016424828
#define __C7 0.002211732
#define __C8 0.00072546
#define __C9 -0.000003582

PARAMS_2(_t,_rh);

_rh = _rh * 100; // relative humidity in %

// Source: https://en.wikipedia.org/wiki/Heat_index
(__C1 + __C2 * _t + __C3 * _rh + __C4 * _t * _rh + __C5 * _t^2 + __C6 * _rh^2 + __C7 * _t^2 * _rh + __C8 * _t * _rh^2 + __C9 * _t^2 * _rh^2)
