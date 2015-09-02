/*
 * Author: Jonpas
 * Makes a list from a string using comma as a delimiter, optionally remove whitespace and check each for object existence.
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Trim Whitespace <BOOL>
 * 2: Check Nil <BOOL>
 *
 * Return Value:
 * Parsed List <ARRAY>
 *
 * Example:
 * ["text", true, false] call ace_slideshow_fnc_makeList
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_list", "_trimWhitespace", "_checkNil"];

private ["_splittedList", "_listTrimmedWhitespace", "_nilCheckPassedList"];

// Split using comma delimiter
_splittedList = [_list, ","] call BIS_fnc_splitString;

// Remove whitespace
_listTrimmedWhitespace = [];
if (_trimWhitespace) then {
    {
        _listTrimmedWhitespace pushBack ([_x] call CBA_fnc_trim);
        nil
    } count _splittedList;
    _list = _listTrimmedWhitespace;
};

// Check for object existence
_nilCheckPassedList = "";
if (_checkNil) then {
    {
        if !(isNil _x) then {
            if (_nilCheckPassedList == "") then {
                _nilCheckPassedList = _x;
            } else {
                _nilCheckPassedList = _nilCheckPassedList + "," + _x;
            };
        };
    } count _list;

    // Add Array characters and parse into array
    _list = "[" + _nilCheckPassedList + "]";
    _list = [] call compile _list;
};

TRACE_4("Lists",_splittedList,_listTrimmedWhitespace,_nilCheckPassedList,_list);

_list // return
