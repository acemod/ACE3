/*
 * Author: jaynus / nou
 * Attack profile: AIR
 * TODO: falls back to Linear
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_AIR;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

_this call FUNC(attackProfile_LIN);
