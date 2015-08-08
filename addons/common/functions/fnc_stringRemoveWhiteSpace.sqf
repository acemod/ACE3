/*
 * Author: Glowbal
 *
 * Removes white spaces from string
 *
 * Arguments:
 * 0: stringA <STRING>
 * 1: stringB <STRING>
 *
 * Return Value:
 * copy of string <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define WHITE_SPACE [20]

private ["_string", "_charArray", "_returnString"];
_string = param [0,"",[""]];
_charArray = toArray _string;
_charArray = _charArray - [((toArray " ") select 0)];
_returnString = toString _charArray;

_returnString;
