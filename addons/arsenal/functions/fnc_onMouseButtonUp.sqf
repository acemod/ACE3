#include "script_component.hpp"
/*
 * Author: commy2
 *
 * Public: No
*/

params ["", "_args"];
_args params ["", "_buttonPressed"];

GVAR(mouseButtonState) set [_buttonPressed, []];
