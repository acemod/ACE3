/*
 * Author: PabstMirror
 * Allows multiple sources to not overwrite showHud command
 * Bitwise AND Logic (a single false in a mask will make it false)
 *
 * Arguments:
 * 0: Source ID <STRING><OPTIONAL>
 * 1: Show Hud Bool Array (8 to set, empty to remove) <ARRAY><OPTIONAL>
 * - [hud, info, radar, compass, direction, menu, group, cursors]
 *
 * Return Value:
 * Resulting ShowHud Array <ARRAY>
 *
 * Example:
 * ["hideHud", [false, true, true, true, true, true, true, false]] call ace_common_fnc_showHud; //This is equivalent to the old showHud false
 * [] call ace_common_fnc_showHud
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {[-1]};

params [["_reason", "", [""]], ["_mask", [], [[]], [0,8]]];

if (isArray (missionConfigFile >> "showHUD")) then {
    //(showHud = 0;) is fine - the array is the problem
    ACE_LOGWARNING("showHUD[] in Description.ext breaks the showHud command");
};

if (_reason != "") then {
    _reason = toLower _reason;
    if (_mask isEqualTo []) then {
        TRACE_2("Setting", _reason, _mask);
        [GVAR(showHudHash), _reason] call FUNC(hashRem);
    } else {
        TRACE_2("Removing", _reason, _mask);
        [GVAR(showHudHash), _reason, _mask] call FUNC(hashSet);
    };
};

GVAR(showHudHash) params ["_reasons", "_masks"];
private _resultMask = [];

for "_index" from 0 to 7 do {
    private _set = true; //Default to true
    {
        if (!(_x select _index)) exitWith {
            _set = false; //Any false will make it false
        };
    } forEach _masks;
    _resultMask pushBack _set;
};

TRACE_2("showHud", _resultMask, _reasons);
showHud _resultMask;

_resultMask
