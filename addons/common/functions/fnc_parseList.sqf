#include "script_component.hpp"
/*
 * Author: Glowbal, Jonpas
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

params ["_list", ["_removeWhitespace", false], ["_checkNil", false]];

// Split using comma delimiter
_list = _list splitString ",";
TRACE_1("Splitted List",_list);

// Remove or Trim Whitespace
private _whitespaceList = [];

{
    if (_removeWhitespace) then {
        _whitespaceList pushBack ([_x] call CBA_fnc_removeWhitespace);
    } else {
        _whitespaceList pushBack ([_x] call CBA_fnc_trim);
    };
    false
} count _list;

_list = _whitespaceList;
TRACE_1("Whitespace List",_list);

// Check for object existence
if (_checkNil) then {
    private _nilCheckedList = [];

    {
        if (!isNil _x) then {
            _nilCheckedList pushBack (missionNamespace getVariable _x);
        };
        false
    } count _list;

    _list = _nilCheckedList;
};

TRACE_1("Final List",_list);

_list
