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

private ["_altitude"];
_altitude = _this;

(1013.25 * exp(-(GVAR(Altitude) + _altitude) / 7990) - 10 * overcast)
