/*
 * Author: Glowbal
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
 *
 * Deprecated
 */
#include "script_component.hpp"

params ["_string", ""];

private ["_charArray", "_returnString"];

_charArray = toArray _string;
_charArray = _charArray - [((toArray " ") select 0)];
_returnString = toString _charArray;

_returnString
