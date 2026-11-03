#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Attack profile: DIR
 * Returns target position with no modifications
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array (not used) <ARRAY>
 * 2: Attack Profile State (not used) <ARRAY>
 * 3: Timestep (not used) <NUMBER>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_DIR;
 *
 * Public: No
 */

params ["_seekerTargetPos"];
_seekerTargetPos
