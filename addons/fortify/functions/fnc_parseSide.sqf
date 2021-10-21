#include "script_component.hpp"
/*
 * Author: Kingsley
 * Parses the given text and returns a side.
 *
 * Arguments:
 * 0: Text <STRING>
 *
 * Return Value:
 * Side <SIDE>
 *
 * Example:
 * ["blufor"] call ace_fortify_fnc_parseSide;
 * ["west"] call ace_fortify_fnc_parseSide;
 * ["b"] call ace_fortify_fnc_parseSide;
 *
 * Public: Yes
 */

params ["_side"];
TRACE_1("parseSide",_side);

if (_side isEqualType sideUnknown) exitWith {_side};

private _char = toLower (_side select [0, 1]);

private _return = switch (_char) do {
    case ("b");
    case ("w"): {west};
    case ("o");
    case ("e"): {east};
    case ("r");
    case ("i"): {resistance};
    case ("c"): {civilian};
    default {sideUnknown};
};

TRACE_2("",_char,_return);
_return
