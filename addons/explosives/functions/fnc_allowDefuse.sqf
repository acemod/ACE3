#include "script_component.hpp"
/*
 * Author: Walthzer
 * Sets if a dynamic defuse action is allowed to be added to a mine.
 *
 * Arguments:
 * 0: Mine <OBJECT>
 * 1: Allow defusal <BOOL>
 *
 * Return Value:
 * Succes <BOOLEAN>
 *
 * Example:
 * [_mine, false] call ace_explosives_fnc_allowDefuse
 *
 * Public: Yes
 */

params [["_mine", objNull, [objNull]], ["_allow", true, [true]]];
TRACE_2("params",_mine,_allow);

if !(_mine in allMines) exitWith {false};

if (_allow && {!([_mine] call FUNC(isAllowedDefuse))}) exitWith {
    GVAR(excludedMines) = GVAR(excludedMines) - [_mine];
    true
};

if (!_allow) exitWith {
    GVAR(excludedMines) pushBackUnique _mine != -1
};

false
