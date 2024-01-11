#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * Adds a round to the blacklist (will be ignored).
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [projectile] call ace_frag_fnc_addBlackList
 *
 * Public: No
 */

params ["_proj"];
TRACE_1("addBlackList",_round);

GVAR(shouldFragCache) set [typeOf _ammo, [false, false]];