#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up wireGuided state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_seekerOnFired
 *
 * Public: No
 */
params ["", "", "", "", "_stateParams", "", ""];
_stateParams params ["", "_seekerStateParams"];

_seekerStateParams set [0, [] call FUNC(gps_getAttackData)];
