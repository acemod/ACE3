#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Initialises the explosives system
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

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(detonationHandlers) = [];

ADDON = true;
