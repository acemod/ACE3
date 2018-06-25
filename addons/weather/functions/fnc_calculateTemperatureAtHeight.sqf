#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the temperature based on altitude and weather
 *
 * Arguments:
 * height - meters <NUMBER>
 *
 * Return Value:
 * temperature - degrees celsius <NUMBER>
 *
 * Example:
 * 500 call ace_weather_fnc_calculateTemperatureAtHeight
 *
 * Public: No
 */

(GVAR(currentTemperature) - 0.0065 * _this)
