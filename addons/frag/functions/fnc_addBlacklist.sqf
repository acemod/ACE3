#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou
 * Adds a round to the blacklist (will be ignored).
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
TRACE_1("addBlackList",_projectile);

_projectile setVariable [QGVAR(blacklisted), true, true];
_projectile removeEventHandler ["HitPart", _projectile getVariable [QGVAR(hitPartEH), -1]];
_projectile removeEventHandler ["Explode", _projectile getVariable [QGVAR(explodeEH), -1]];