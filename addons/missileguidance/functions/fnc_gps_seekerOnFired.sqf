#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Sets up wireGuided state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_wire_onFired
 *
 * Public: No
 */
params ["", "", "", "", "_stateParams", "", ""];
_stateParams params ["", "_seekerStateParams"];

_seekerStateParams set [0, [] call FUNC(gps_getAttackData)];
