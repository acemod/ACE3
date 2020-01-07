#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Adjust flight direction towards indicated target
 *
 * Arguments:
 * 0: projectile <OBJECT>
 * 1: Guidance Array <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [shell, [0,1,6]] call ace_missileguidance_fnc_runProjectileAdjust;
 *
 * Public: No
 */

params ["_projectile", "_guidanceVector"]

_projectileVector = vectorDir _projectile;

_diffVector = _guidanceVector vectorDiff _projectileVector;

_xDiff = atan2(_diffVector#0, _diffVector#1);
_yDiff = atan2(_diffVector#2, sqrt(((_diffVector#0)^2) + ((_diffVector#1)^2)));

[_xDiff,_yDiff]
