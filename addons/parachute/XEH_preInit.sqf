/*
 * Author: Garth 'L-H' de Wet
 * Initialises the parachute system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

ADDON = false;

PREP(doLanding);
PREP(handleInfoDisplayChanged);
PREP(hideAltimeter);
PREP(onEachFrame);
PREP(showAltimeter);

ADDON = true;
