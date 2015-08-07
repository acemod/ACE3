/*
 * Author: Glowbal
 *
 * Removes white spaces from string
 *
 * Argument:
 * 0: stringA (STRING)
 * 1: stringB (STRING)
 *
 * Return value:
 * copy of string (STRING)
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
