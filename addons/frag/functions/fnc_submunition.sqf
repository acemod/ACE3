#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds event handlers for submunition fragmentation. 
 * It begins by confirming fragmentation and submunition fragmentation is
 * enabled, requests cached (or live calculated) ammo information array.
 * and uses that information to add event handlers as needed to the given
 * submunition.
 *
 * Arguments:
 * Inherits from BI SubmunitionCraeted EH
 * 
 * Return Value:
 * none
 *
 * Example:
 * ["", _submunitionProjectile] call ace_frag_submunition
 *
 * Public: No
 */
 
if (!GVAR(enabled) || {GVAR(enSubMunit) == 0}) exitWith {};
// params ["_projectile", "_submunitionProjectile", "_pos", "_velocity"];
params ["", "_submunitionProjectile"];

private _shouldFrag = GVAR(shouldFragCache) getOrDefaultCall [typeOf _submunitionProjectile, FUNC(shouldFrag), true];
_shouldFrag params ["_doFrag", "_doSubmunit"]; 


if (_doFrag) then {
    _submunitionProjectile addEventHandler ["Explode", {[_this, true] call FUNC(doFrag)}];
};

if (_doSubmunit) then {
    _submunitionProjectile addEventHandler ["SubmunitionCreated", {_this call FUNC(submunition)}];
};

#ifdef DEBUG_MODE_FULL
    [_submunitionProjectile] call UNC(dev_addRound);
#endif