#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Attack profile: DIR
 * Returns target position with no modifications
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
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
