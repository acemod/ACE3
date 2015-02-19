/**
 * fn_stringTrim.sqf
 * @Descr: Removes white spaces from string
 * @Author: Glowbal
 *
 * @Arguments: [string STRING]
 * @Return: STRING copy of string
 * @PublicAPI: true
 */

#include "script_component.hpp"

#define WHITE_SPACE [20]

private ["_string", "_charArray", "_returnString"];
_string = [_this, 0, "",[""]] call bis_fnc_param;
_charArray = toArray _string;
_charArray = _charArray - [((toArray " ") select 0)];
_returnString = toString _charArray;

_returnString;