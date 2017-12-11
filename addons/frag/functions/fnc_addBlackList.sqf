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
 * [bullet] call ace_frag_fnc_addBlackList
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_round"];
TRACE_1("addBlackList",_round);

GVAR(blackList) pushBack _round;
