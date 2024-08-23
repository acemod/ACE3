#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou
 * Adds a round to the blacklist (will be ignored) and removes any ace_frag event handlers added to it.
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile] call ace_frag_fnc_addBlackList
 *
 * Public: No
 */

params ["_projectile"];
TRACE_2("addBlackList",_projectile,typeOf projectile);

_projectile setVariable [QGVAR(blacklisted), true];
(_projectile getVariable [QGVAR(spallEH), [-1, -1]]) params ["_hitPartEH", "_penetratedEH"];
_projectile removeEventHandler ["HitPart", _hitPartEH];
_projectile removeEventHandler ["Penetrated", _penetratedEH];
_projectile removeEventHandler [
    "Explode",
    _projectile getVariable [QGVAR(fragEH), -1]
];
