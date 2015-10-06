/*
 * Author: Ruthberg
 *
 * Calculates the temperature based on altitude and weather
 *
 * Arguments:
 * height - meters <NUMBER>
 *
 * Return Value:
 * temperature - degrees celsius <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

(GVAR(currentTemperature) - 0.0065 * _this)
