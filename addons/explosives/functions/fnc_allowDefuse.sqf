#include "..\script_component.hpp"
/*
 * Author: Walthzer
 * Sets if a dynamic defuse action is allowed to be added to a mine.
 *
 * Arguments:
 * 0: Mine <OBJECT> (default: objNull)
 * 1: Allow defusal <BOOL> (default: true)
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [cursorObject, false] call ace_explosives_fnc_allowDefuse
 *
 * Public: Yes
 */

params [["_mine", objNull, [objNull]], ["_allow", true, [true]]];
TRACE_2("params",_mine,_allow);

if !(_mine in allMines) exitWith {
    false // return
};

if (_allow && {!(_mine call FUNC(isAllowedDefuse))}) exitWith {
    GVAR(excludedMines) = GVAR(excludedMines) - [_mine];

    true // return
};

if (!_allow) exitWith {
    GVAR(excludedMines) pushBackUnique _mine != -1 // return
};

false // return
