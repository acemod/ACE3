/*
 * Author: commy2
 *
 * Create a centered, colored text.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Color <ARRAY>
 *
 * Return Value:
 * Text <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_string", "_color"];
params ["_text","_color"];
_string = format ["%1", _string];
_color params ["_R","_G","_B"];
_color = (
  [255 * _R, 2] call FUNC(toHex)
) + (
  [255 * _G, 2] call FUNC(toHex)
) + (
  [255 * _B, 2] call FUNC(toHex)
);

parseText format ["<t align='center' color='#%2' >%1</t>", _string, _color];
