/*
 * Author: GitHawk
 * Make a dummy object by disabling collision and turning it.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vector dirAndUp <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [dummy, [[1,0,0],[0,0,1]]] call ace_rearm_fnc_makeDummy
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_obj", objNull, [objNull]],
    ["_dirAndUp", [[1,0,0],[0,0,1]], [[]]]
];

_obj setVectorDirAndUp _dirAndUp;
_obj allowDamage false;
ACE_player disableCollisionWith _obj;
