#include "script_component.hpp"
/*
 * Author: commy2
 * Handles mouse button press.
 *
 * Arguments:
 * 0: Not used
 * 1: Args <ARRAY>
 *   1.0: Not used
 *   1.1: Mouse button <NUMBER>
 *   1.2: Mouse X position <NUMBER>
 *   1.3: Mouse Y position <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["", "_buttonPressed", "_xPos", "_yPos"];

GVAR(mouseButtonState) set [_buttonPressed, [_xPos, _yPos]];
