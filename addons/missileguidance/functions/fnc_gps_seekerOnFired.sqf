#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up wireGuided state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * 0: Fired EH arguments (not used) <ARRAY>
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
 * [] call ace_missileguidance_fnc_gps_seekerOnFired
 *
 * Public: No
 */
params ["", "", "", "", "_stateParams", "", ""];
_stateParams params ["", "_seekerStateParams"];

_seekerStateParams set [0, [] call FUNC(gps_getAttackData)];
