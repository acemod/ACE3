/*
 * Author: commy2, idea by Falke
 *
 * Returns a brightness value depending on the sun and moon state. Ranges from 0 to 1 (dark ... bright).
 *
 * Argument:
 * None.
 *
 * Return value:
 * Ambient brightness (Number)
 */
#include "script_component.hpp"

(sunOrMoon * sunOrMoon * (1 - overcast * 0.25) + (moonIntensity/5) * (1 - overcast)) min 1
