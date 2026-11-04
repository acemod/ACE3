#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up wireGuided state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * 0: Fired EH arguments <ARRAY>
 * 1: Launch Parameters (not used) <ARRAY>
 * 2: Flight Parameters (not used) <ARRAY>
 * 3: Seeker Parameters (not used) <ARRAY>
 * 4: State Parameters <ARRAY>
 * 5: Target Data (not used) <ARRAY>
 * 6: Navigation State Parameters (not used) <ARRAY>
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
