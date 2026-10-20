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
if ((_p == 0) && {_d == 0}) then { WARNING_1("Ammo %1 has zero P/D",typeOf _projectile) };

private _pid_x = [_p, 0, _d, 0] call CBA_pid_fnc_create;
private _pid_y = [_p, 0, _d, 0] call CBA_pid_fnc_create;

private _navigationParams = [
    _pid_x,
    _pid_y
];
_navigationParams
