#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates density altitude for a given air density
 *
 * Arguments:
 * density of air - kg * m^(-3) <NUMBER>
 *
 * Return Value:
 * density altitude - m <NUMBER>
 *
 * Example:
 * 1.225 call ace_weather_fnc_calculateDensityAltitude
 *
 * Public: No
 */

// Source: http://wahiduddin.net/calc/density_altitude.htm

((44.3308 - 42.2665 * _this ^ 0.2349692456) * 1000)
