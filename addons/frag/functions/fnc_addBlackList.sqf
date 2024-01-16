#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * Adds a round type to the blacklist (will be ignored).
 *
 * Arguments:
 * 0: Projectile <OBJECT> or classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [projectile] call ace_frag_fnc_addBlackList
 *
 * Public: No
 */

params ["_projectile"];
TRACE_1("addBlackList",_round);


if (_projectile isEqualType objNull) then {
    _projectile = typeOf _projectile;
};

GVAR(shouldFragCache) set [_projectile, false];
