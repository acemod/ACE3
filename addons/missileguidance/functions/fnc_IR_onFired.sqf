#include "..\script_component.hpp"
/*
 * Author: tcvm
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
params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];
_launchParams params ["", "_targetLaunchParams"];
_targetLaunchParams params ["_target"];

private _flareDistanceFilter = getNumber (configOf _projectile >> QUOTE(ADDON) >> "flareDistanceFilter");
private _flareAngleFilter = getNumber (configOf _projectile >> QUOTE(ADDON) >> "flareAngleFilter");

_seekerStateParams set [0, _flareDistanceFilter];
_seekerStateParams set [1, _flareAngleFilter];
_seekerStateParams set [2, _target];

