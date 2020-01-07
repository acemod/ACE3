#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Attack profile: Linear (used by DAGR)
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_LIN;
 *
 * Public: No
 */

params ["_projectile", "_shooter","_extractedInfo", "_seekerTargetPos"];
_targetInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

_seekerTargetPos;
