#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up IR state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_IR_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];

private _flareDistanceFilter = getNumber (configOf _projectile >> "flareDistanceFilter");
private _flareAngleFilter = getNumber (configOf _projectile >> "flareAngleFilter");

_seekerStateParams set [0, _flareDistanceFilter];
_seekerStateParams set [1, _flareAngleFilter];
_seekerStateParams set [2, missileTarget _projectile];

