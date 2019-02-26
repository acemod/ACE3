#include "script_component.hpp"

params ["", "_args"];
_args params ["", "_buttonPressed", "_xPos", "_yPos"];

GVAR(mouseButtonState) set [_buttonPressed, [_xPos, _yPos]];
