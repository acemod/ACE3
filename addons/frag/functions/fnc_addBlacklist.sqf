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
_projectile removeEventHandler ["HitPart", _projectile getVariable [QGVAR(hitPartEventHandler), -1]];

nil // return
