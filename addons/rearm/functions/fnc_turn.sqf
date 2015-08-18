/*
 * Author: GitHawk
 * Turns an object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Vector dirAndUp <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [dummy, [[1,0,0],[0,0,1]]] call ace_rearm_fnc_turn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_obj", "_dirAndUp"];

_obj setVectorDirAndUp _dirAndUp;
