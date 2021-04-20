#include "script_component.hpp"
/*
 * Author: Walthzer
 * Excludes a passed mine from the dynamic defuse action.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 * 1: Allow Ace defusal <BOOL>
 *
 * Return Value:
 * Succes <BOOLEAN>
 *
 * Example:
 * [_mine] call ace_explosives_fnc_allowDefuse
 *
 * Public: Yes
 */

params [["_mine", objNull, [objNull]], ["_allow", true, [true]]];
TRACE_1("params",_mine,_allow);

if (!(_mine in allMines)) exitWith {false};
	
if (_allow) then {
	if ([_mine] call FUNC(isAllowedDefuse)) exitWith {false};
	GVAR(excludedMines) = GVAR(excludedMines) - [_mine];
} else {
	if((GVAR(excludedMines) pushBackUnique _mine) == -1) exitWith {false};
};

true
