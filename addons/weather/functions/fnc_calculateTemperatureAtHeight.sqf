/*
 * Author: Ruthberg
 *
 * Calculates the temperature based on altitude and weather
 *
 * Arguments:
 * 0: height - meters <NUMBER>
 *
 * Return Value:
 * 0: temperature - degrees celsius <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

(GVAR(currentTemperature) - 0.0065 * _this)
