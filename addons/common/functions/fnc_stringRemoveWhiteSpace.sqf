/*
 * Author: Glowbal
 * Removes whitespace from a string.
 *
 * Arguments:
 * 0: String <STRING>
 *
 * Return Value:
 * String Without Whitespace <STRING>
 *
 * Example:
 * _stringWithoutWhitespace = ["String with whitespace"] call ace_common_fnc_stringRemoveWhiteSpace
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_string"];

ACE_DEPRECATED(QFUNC(stringRemoveWhiteSpace),"3.10.0","CBA_fnc_removeWhitespace");

(_string splitString " ") joinString ""
