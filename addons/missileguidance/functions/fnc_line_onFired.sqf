#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up line state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * 0: Fired EH arguments <ARRAY>
 * 1: Launch Parameters (not used) <ARRAY>
 * 2: Flight Parameters (not used) <ARRAY>
 * 3: Seeker Parameters (not used) <ARRAY>
 * 4: State Parameters (not used) <ARRAY>
 * 5: Target Data (not used) <ARRAY>
 * 6: Navigation State Parameters (not used) <ARRAY>
 *
 * Return Value:
 * Navigation Parameters <ARRAY>
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
