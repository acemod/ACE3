#include "script_component.hpp"
/*
 * Author: jaynus / nou, PabstMirror
 * Do attack profile with a valid seeker target location
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_doAttackProfile;
 *
 * Public: No
 */

params ["_projectile", "_shooter","_extractedInfo"];
_targetInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];

private _attackProfileFunction = getText (configFile >> QGVAR(AttackProfiles) >> _attackProfile >> "functionName");

private _attackProfilePos = _this call (missionNamespace getVariable _attackProfileFunction);

_attackProfilePos;
