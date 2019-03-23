#include "script_component.hpp"

params ["", "_args"];
_args params ["", "_buttonPressed"];

GVAR(mouseButtonState) set [_buttonPressed, []];
