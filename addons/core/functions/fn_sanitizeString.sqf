/*
 * Author: CAA-Picard, based on Killzone-Kid code
 *
 * Removes quotation marks to avoid exploits and optionally html tags from text to avoid conflicts with structured text.
 *
 * Arguments:
 * 0: Source string (String)
 * 1: Remove html tags (Bool, optional)
 *
 * Return Value:
 * Sanitized string
 */

 private ["_string", "_removeTags", "_array", "_arrayNew"];

_string = _this select 0;
_removeTags = _this select 1;
if (isNil "_removeTags") then {_removeTags = false};

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
} forEach _array;

toString _arrayNew
