/*
 * Author: Ruthberg
 *
 * Calculates density altitude for a given air density
 *
 * Arguments:
 * density of air - kg * m^(-3) <NUMBER>
 *
 * Return Value:
 * density altitude - m <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

// Source: http://wahiduddin.net/calc/density_altitude.htm

((44.3308 - 42.2665 * _this ^ 0.2349692456) * 1000)
