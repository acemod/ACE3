//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

private["_player", "_currentFireMode"];

_currentFireMode = ACE_player getVariable["ace_missileguidance_attackProfile", "TOP"];
if(_currentFireMode == "LIN") then {
    _currentFireMode = "TOP";
} else {
    _currentFireMode = "LIN";
};
ACE_player setVariable["ace_missileguidance_attackProfile", _currentFireMode, false];
