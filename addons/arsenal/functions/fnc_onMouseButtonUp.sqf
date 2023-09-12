#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handles mouse button release.
 *
 * Arguments:
 * 0: Not used
 * 1: Args <ARRAY>
 * - 0: Not used
 * - 1: Mouse button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["", "_args"];
_args params ["", "_buttonPressed"];

GVAR(mouseButtonState) set [_buttonPressed, []];
