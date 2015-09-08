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

private ["_charArray", "_returnString"];
params [["_string", "", [""]]];
_charArray = toArray _string;
_charArray = _charArray - (toArray " ");
_returnString = toString _charArray;

_returnString
