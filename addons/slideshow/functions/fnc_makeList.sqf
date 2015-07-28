/*
 * Author: Jonpas
 * Makes a list from a string using comma as a delimiter, optionally remove whitespace and check each for object existence.
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Remove Whitespace <BOOL>
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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_3(_list,_removeWhitespace,_checkNil);

private ["_splittedList", "_listNoWhitespace", "_nilCheckPassedList"];

// Split using comma delimiter
_splittedList = [_list, ","] call BIS_fnc_splitString;

// Remove whitespace
_listNoWhitespace = [];
if (_removeWhitespace) then {
    {
        _listNoWhitespace pushBack ([_x] call EFUNC(common,stringRemoveWhiteSpace));
    } forEach _splittedList;
    _list = _listNoWhitespace;
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
    } forEach _list;

    // Add Array characters and parse into array
    _list = "[" + _nilCheckPassedList + "]";
    _list = [] call compile _list;
};

TRACE_4("Lists",_splittedList,_listNoWhitespace,_nilCheckPassedList,_list);

_list
