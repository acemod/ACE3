#include "script_component.hpp"
/*
 * Author: Walthzer
 * Excludes a passed mine from the dynamic defuse action.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 *
 * Return Value:
 * Index in ace_explosives_excludedMines (or -1) <NUMBER>
 *
 * Example:
 * [_mine] call ace_explosives_fnc_excludeMine
 *
 * Public: Yes
 */

params ["_mine"];
TRACE_1("params",_mine);

if (!(_mine in allMines)) exitWith {-1};

GVAR(excludedMines) pushBackUnique _mine;
