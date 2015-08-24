/*
 * Author: Jonpas
 * Makes a list from a string using comma as a delimiter, optionally trim or remove whitespace and check each for object existence.
 *
 * Arguments:
 * 0: List <STRING>
 * 1: Remove or Trim Whitespace <BOOL> (default: false (trim))
 * 2: Check Nil <BOOL> (default: false)
 *
 * Return Value:
 * Parsed List <ARRAY>
 *
 * Example:
 * ["text", true, false] call ace_common_fnc_parseList
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_splittedList", "_whitespaceList", "_nilCheckedList"];
params ["_list", ["_removeWhitespace", false], ["_checkNil", false]];


// Split using comma delimiter
_splittedList = [_list, ","] call BIS_fnc_splitString;


// Remove or Trim Whitespace
_whitespaceList = [];
{
    if (_removeWhitespace) then {
        _whitespaceList pushBack ([_x] call FUNC(stringRemoveWhiteSpace));
    } else {
        _whitespaceList pushBack ([_x] call CBA_fnc_trim);
    };
    nil
} count _splittedList;
_list = _whitespaceList;


// Check for object existence
_nilCheckedList = "";
if (_checkNil) then {
    {
        if !(isNil _x) then {
            if (_nilCheckedList == "") then {
                _nilCheckedList = _x;
            } else {
                _nilCheckedList = _nilCheckedList + "," + _x;
            };
        };
    } count _list;

    // Add Array characters and parse into array
    _list = [] call compile format ["[%1]", _nilCheckedList];
};

TRACE_4("Lists",_splittedList,_whitespaceList,_nilCheckedList,_list);

_list
