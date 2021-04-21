#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up line state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_line_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_stateParams params ["", "", "", "", "_navigationParams"];

private _ammoConfig = configOf _projectile;
private _p = getNumber (_ammoConfig >> QUOTE(ADDON) >> "lineGainP");
private _d = getNumber (_ammoConfig >> QUOTE(ADDON) >> "lineGainD");
private _correctionDistance = getNumber (_ammoConfig >> QUOTE(ADDON) >> "correctionDistance");

_navigationParams set [0, _p];
_navigationParams set [1, _i];
_navigationParams set [2, _d];

_navigationParams set [3, 0];
_navigationParams set [4, 0];
_navigationParams set [5, _correctionDistance];

