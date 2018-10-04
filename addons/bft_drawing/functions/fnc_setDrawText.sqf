#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Set weather or not to draw text
 *
 * Arguments:
 *   1: Weather or not to draw text <BOOL>
 *
 * Return Value:
 *   True  <BOOL>
 *
 * Example:
 *   [false] call ace_bft_drawing_fnc_setDrawText;
 *
 * Public: No
 */


params ["_drawText"];

GVAR(mapDrawText) = _drawText;

true