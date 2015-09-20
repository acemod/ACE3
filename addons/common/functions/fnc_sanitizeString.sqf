/*
 * Author: esteldunedain, based on Killzone-Kid code
 * Removes quotation marks to avoid exploits and optionally html tags from text to avoid conflicts with structured text.
 *
 * Arguments:
 * 0: Source string <STRING>
 * 1: Remove html tags (default: false) <BOOL>
 *
 * Return Value:
 * Sanitized string
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_string", ["_removeTags", false]];

private "_array";
_array = [];

{
    switch _x do {
        case 60 : {
            if (_removeTags) then {
                _array append toArray "&lt;";
            } else {
                _array pushBack _x;
            };
        };
        case 62 : {
            if (_removeTags) then {
                _array append toArray "&gt;";
            } else {
                _array pushBack _x;
            };
        };

        case 34 : {
        };

        case 39 : {
        };

        default {
            _array pushBack _x;
        };
    };
    false
} count toArray _string;

toString _array // return
