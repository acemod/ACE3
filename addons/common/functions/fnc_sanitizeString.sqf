/*
 * Author: esteldunedain, based on Killzone-Kid code
 * Removes quotation marks to avoid exploits and optionally html tags from text to avoid conflicts with structured text.
 *
 * Arguments:
 * 0: Source string <STRING>
 * 1: Remove html tags (optional) <BOOL>
 *
 * Return Value:
 * Sanitized string
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_string", ["_removeTags", false]];

private ["_array", "_arrayNew"];

_array = toArray _string;

_arrayNew = [];
{
    switch _x do {
        case 60 : {
            _arrayNew = if (_removeTags) then {_arrayNew + toArray "&lt;";} else {_arrayNew + [_x];};
        };
        case 62 : {
            _arrayNew = if (_removeTags) then {_arrayNew + toArray "&gt;";} else {_arrayNew + [_x];};
        };
        case 34 : {
        };
        case 39 : {
        };
        default {
            _arrayNew = _arrayNew + [_x];
        };
    };
    false
} count _array;

toString _arrayNew
