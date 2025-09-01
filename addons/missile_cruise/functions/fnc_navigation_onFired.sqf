#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up proportional navigation state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_proNav_onFired
 *
 * Public: No
 */
params ["_firedEH"];
_firedEH params ["","","","","","","_projectile"];

private _navigationParams = [
    NAVIGATION_STATE_LAUNCH,
    0,
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    0,
    0
];
_navigationParams
