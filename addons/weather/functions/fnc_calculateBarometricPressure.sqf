/*
 * Author: Ruthberg
 *
 * Calculates the barometric pressure based on altitude and weather
 *
 * Arguments:
 * 0: altitude - meters <NUMBER>
 *
 * Return Value:
 * 0: barometric pressure - hPA <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

(101325 * exp(-(GVAR(Altitude) + _this) / 7990) - 1000 * overcast) / 100
