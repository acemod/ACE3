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

(331.3 + (0.6 * _this))
