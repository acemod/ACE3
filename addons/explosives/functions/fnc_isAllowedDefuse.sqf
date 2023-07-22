#include "script_component.hpp"
/*
 * Author: Walthzer
 * Check if a mine is allowed to recieve a dynamic defuse action.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 *
 * Return Value:
 * Allowed <BOOLEAN>
 *
 * Example:
 * [_mine] call ace_explosives_fnc_isAllowedDefuse
 *
 * Public: Yes
 */

params [["_mine", objNull, [objNull]]];
TRACE_1("params",_mine);

!(_mine in GVAR(excludedMines))
