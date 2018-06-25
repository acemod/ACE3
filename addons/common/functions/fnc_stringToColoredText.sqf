#include "script_component.hpp"
/*
 * Author: commy2
 * Create a centered, colored text.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Color <ARRAY, STRING>
 *
 * Return Value:
 * Text <STRING>
 *
 * Example:
 * ["text", [0, 1, 2]] call ace_common_fnc_stringToColoredText
 *
 * Public: Yes
 */

params ["_string", "_color"];

_string = format ["%1", _string];

if (_color isEqualType []) then {
    _color = "#" + (
        [255 * (_color select 0), 2] call FUNC(toHex)
    ) + (
        [255 * (_color select 1), 2] call FUNC(toHex)
    ) + (
        [255 * (_color select 2), 2] call FUNC(toHex)
    );
};

parseText format ["<t align='center' color='%1' >%2</t>", _color, _string]
