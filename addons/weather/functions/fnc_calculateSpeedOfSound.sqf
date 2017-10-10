/*
 * Author: Ruthberg
 * Calculates the speed of sound for a given temperature
 *
 * Arguments:
 * temperature - degrees celsius <NUMBER>
 *
 * Return Value:
 * speed of sound - m/s <NUMBER>
 *
 * Example:
 * 0 call ace_weather_fnc_calculateSpeedOfSound
 *
 * Public: No
 */
#include "script_component.hpp"

(331.3 * sqrt(1 + (_this / 273.15)))
