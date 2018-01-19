/*
 * Author: jaynus / nou
 * Attack profile: Direct (falls back to seeker target position)
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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

_this select 0
