/*
 * Author: Ruthberg
 * Calculates the barometric pressure based on altitude and weather
 *
 * Arguments:
 * altitude - meters <NUMBER>
 *
 * Return Value:
 * barometric pressure - hPA <NUMBER>
 *
 * Example:
 * 0 call ace_weather_fnc_calculateBarometricPressure
 *
 * Public: No
 */
#include "script_component.hpp"

((1013.25 - 10 * GVAR(currentOvercast)) * (1 - (0.0065 * (EGVAR(common,mapAltitude) + _this)) / (KELVIN(GVAR(currentTemperature)) + 0.0065 * EGVAR(common,mapAltitude))) ^ 5.255754495);
