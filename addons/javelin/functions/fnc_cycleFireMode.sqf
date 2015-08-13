/*
 * Author: Jaynus
 * Cycle through fire Modes for Javelin
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_javelin_fnc_cycleFireMode
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("enter", _this);

private ["_player", "_currentFireMode"];

_currentFireMode = ACE_player getVariable["ace_missileguidance_attackProfile", "JAV_TOP"];
if(_currentFireMode == "JAV_DIR") then {
    _currentFireMode = "JAV_TOP";
} else {
    _currentFireMode = "JAV_DIR";
};
ACE_player setVariable["ace_missileguidance_attackProfile", _currentFireMode, false];
