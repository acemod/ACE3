/*
 * Author: commy2, idea by Falke
 * Returns a brightness value depending on the sun and moon state. Ranges from 0 to 1 (dark ... bright).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Ambient brightness <NUMBER>
 *
 * Example:
 * [] call ace_common_fnc_ambientBrightness
 *
 * Public: Yes
 */
#include "script_component.hpp"

(sunOrMoon * sunOrMoon * (1 - overcast * 0.25) + (moonIntensity / 5) * (1 - overcast)) min 1
