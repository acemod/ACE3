#include "script_component.hpp"
/*
 * Author: commy2
 *
 * Public: No
*/

params ["", "_args"];
_args params ["", "_buttonPressed", "_xPos", "_yPos"];

GVAR(mouseButtonState) set [_buttonPressed, [_xPos, _yPos]];
