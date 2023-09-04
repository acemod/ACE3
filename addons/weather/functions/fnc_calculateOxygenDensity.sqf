#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Calculates the oxygen density
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: pressure - hPa <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * density of oxygen - kg * m^(-3) <NUMBER>
 *
 * Example:
 * [0, 1020] call ace_weather_fnc_calculateOxygenDensity
 *
 * Public: No
 */

(_this call FUNC(calculateAirDensity)) * 0.21
