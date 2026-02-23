#include "..\script_component.hpp"
/*
 * Author: Walthzer
 * Check if a mine is allowed to receive a dynamic defuse action.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 *
 * Return Value:
 * Allowed to defuse <BOOL>
 *
 * Example:
 * cursorObject call ace_explosives_fnc_isAllowedDefuse
 *
 * Public: Yes
 */

params [["_mine", objNull, [objNull]]];
TRACE_1("params",_mine);

!(_mine in GVAR(excludedMines)) // return
