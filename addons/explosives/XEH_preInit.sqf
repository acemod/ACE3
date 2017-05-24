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
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    GVAR(explosivesOrientations) = []
};

GVAR(detonationHandlers) = [];

ADDON = true;
