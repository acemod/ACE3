#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Escapes special characters used in regex from a string
 *
 * Arguments:
 * 0: String <STRING>
 *
 * Return Value:
 * Safe string <STRING>
 *
 * Example:
 * "\Q.*?AK-15.*?\E" call ace_common_fnc_escapeRegex
 *
 * Public: Yes
 */
params [["_string", "", [""]]];

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#escaping
_string regexReplace ["[.?*+^$[\]\\(){}|-]/gio", "\\$&"]
