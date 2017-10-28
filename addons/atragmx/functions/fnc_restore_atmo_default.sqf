/*
 * Author: Ruthberg
 * Restores the atmospheric data defaults
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_restore_atmo_default
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(atmosphereModeTBH) = true;
GVAR(altitude) = 0;
GVAR(temperature) = 15;
GVAR(barometricPressure) = 1013.25;
GVAR(relativeHumidity) = 0.0;

[] call FUNC(update_atmo_selection);
[] call FUNC(update_atmosphere);
