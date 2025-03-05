#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Allows multiple sources to not overwrite showHud command.
 * Bitwise AND Logic (a single false in a mask will make it false).
 *
 * Arguments:
 * 0: Source ID <STRING> (default: "")
 * 1: Show Hud Bool Array (10 to set, empty to remove) <ARRAY> (default: [])
 * - [hud, info, radar, compass, direction, menu, group, cursors, panels, kills]
 * - hud: Boolean - show scripted HUD (same as normal showHUD true/false)
 * - info: Boolean - show vehicle + soldier info (hides weapon info from the HUD as well)
 * - radar: Boolean - show vehicle radar
 * - compass: Boolean - show vehicle compass
 * - direction: Boolean - show tank direction indicator (not present in vanilla Arma 3)
 * - menu: Boolean - show commanding menu (hides HC related menus)
 * - group: Boolean - show group info bar (hides squad leader info bar)
 * - cursors: Boolean - show HUD weapon cursors (connected with scripted HUD)
 * - panels: Boolean - show vehicle panels / GPS
 * - kills: Boolean - show "x killed by y" systemChat messages
 * - showIcon3D: is unsupported as it has inverted logic
 *
 * Return Value:
 * Resulting ShowHud Array <ARRAY>
 *
 * Example:
 * ["hideHud", [false, true, true, true, true, true, true, false, true, true]] call ace_common_fnc_showHud; //This is equivalent to the old showHud false
 * [] call ace_common_fnc_showHud; //sets `showHud` and returns the result array used
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {[-1]};

params [["_reason", "", [""]], ["_mask", [], [[]]]];

if (isArray (missionConfigFile >> "showHUD")) then {
    //(showHud = 0;) is fine - the array is the problem
    WARNING("showHUD[] in Description.ext breaks the showHud command");
};

if (_reason != "") then {
    _reason = toLower _reason;
    if (_mask isEqualTo []) then {
        TRACE_2("Removing",_reason,_mask);
        GVAR(showHudHash) deleteAt _reason;
    } else {
        while {(count _mask) < 10} do { _mask pushBack true; };
        TRACE_2("Setting",_reason,_mask);
        GVAR(showHudHash) set [_reason, _mask];
    };
};

private _masks = values GVAR(showHudHash);
private _resultMask = [];

for "_index" from 0 to 9 do {
    private _set = true; //Default to true
    {
        if !(_x select _index) exitWith {
            _set = false; //Any false will make it false
        };
    } forEach _masks;
    _resultMask pushBack _set;
};

TRACE_2("showHud",_resultMask,keys GVAR(showHudHash));
showHUD _resultMask;

_resultMask
