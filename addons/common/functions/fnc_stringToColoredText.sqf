/*
 * Author: commy2
 *
 * Create a centered, colored text.
 *
 * Argument:
 * 0: Text (Anything)
 * 2: Color (Array)
 *
 * Return value:
 * Text
 */
#include "script_component.hpp"

private ["_string", "_color"];

_string = format ["%1", _this select 0];
_color = _this select 1;

_color = (
  [255 * (_color select 0), 2] call FUNC(toHex)
) + (
  [255 * (_color select 1), 2] call FUNC(toHex)
) + (
  [255 * (_color select 2), 2] call FUNC(toHex)
);

parseText format ["<t align='center' color='#%2' >%1</t>", _string, _color];
