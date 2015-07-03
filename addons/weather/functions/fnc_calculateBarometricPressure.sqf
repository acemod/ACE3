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

((1013.25 - 10 * overcast) * (1 - (0.0065 * (GVAR(Altitude) + _this)) / (KELVIN(GVAR(currentTemperature)) + 0.0065 * GVAR(Altitude))) ^ 5.255754495);