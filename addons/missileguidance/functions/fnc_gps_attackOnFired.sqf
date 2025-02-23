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
 * [] call ace_missileguidance_fnc_gps_attackOnFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams", "", ""];
_stateParams params ["", "", "_attackProfileStateParams"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];

_attackProfileStateParams set [0, [] call FUNC(gps_getAttackData)];
_attackProfileStateParams set [1, (getPosASL _projectile) select 2];
_attackProfileStateParams set [2, false];
