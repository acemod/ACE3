#include "..\script_component.hpp"
/*
 * Author: tcvm
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

private _ammoConfig = configOf _projectile;
private _p = getNumber (_ammoConfig >> QUOTE(ADDON) >> "lineGainP");
private _d = getNumber (_ammoConfig >> QUOTE(ADDON) >> "lineGainD");
private _correctionDistance = getNumber (_ammoConfig >> QUOTE(ADDON) >> "correctionDistance");

if (_correctionDistance == 0) then {
    _correctionDistance = 1;
};

private _navigationParams = [
    _p, 0, _d,
    0,
    0,
    _correctionDistance
];
_navigationParams
