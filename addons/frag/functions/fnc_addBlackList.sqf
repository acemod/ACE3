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

params ["_proj"];
TRACE_1("addBlackList",_round);

switch (typeName _proj) do {
    case "OBJECT": {
        GVAR(shouldFragCache) set [typeOf _proj, false];
    };
    case "STRING": {
        GVAR(shouldFragCache) set [_proj, false];
    };
    default { };
};