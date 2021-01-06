#include "script_component.hpp"
/*
 * Author: commy2
 * Removes timestamp from end of a string.
 *
 * Arguments:
 * 0: Marker text string <STRING>
 *
 * Return Value:
 * Input with timestamp removed <STRING>
 *
 * Example:
 * "abc [12:00 am]" call ace_markers_fnc_removeTimestamp // "abc"
 * "[13:37]" call ace_markers_fnc_removeTimestamp // ""
 * "xyz [123]" call ace_markers_fnc_removeTimestamp // "xyz [123]"
 *
 * Public: No
 */
#define DIGITS "0123456789"

params ["_original"];

// @todo, 2.02 reverse command will support STRING types
private _string = toArray _original;
reverse _string;
_string = toString _string;

if (_string select [0, 1] != "]") exitWith {_original};

private _timestampLength = (_string find "[") + 1;
_string = _string select [0, _timestampLength];

// @todo
_string = toArray _string;
reverse _string;
_string = toString _string;

if (_string select [0, 1] != "[") exitWith {_original};

if !(_string select [1, 1] in DIGITS) exitWith {_original};
if !(_string select [2, 1] in DIGITS) exitWith {_original};
if (_string select [3, 1] != ":") exitWith {_original};
if !(_string select [4, 1] in DIGITS) exitWith {_original};
if !(_string select [5, 1] in DIGITS) exitWith {_original};

[_original select [0, count _original - _timestampLength], " "] call CBA_fnc_rightTrim // return
