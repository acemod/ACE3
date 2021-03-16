#include "script_component.hpp"
/*
 * Author: Walthzer
 * Reinclude a passed mine with the dynamic defuse action.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 *
 * Return Value:
 * Succes <BOOLEAN>
 *
 * Example:
 * [_mine] call ace_explosives_fnc_stopExcludingMine;
 *
 * Public: Yes
 */

params ["_mine"];
TRACE_1("params",_mine);

if (!(_mine in GVAR(excludedMines))) exitWith {false};

GVAR(excludedMines) =  GVAR(excludedMines) - [_mine];

true