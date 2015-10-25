/*
 * Author: Jaynus
 * ?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_javelin_fnc_showFireMode
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("enter", _this);

private["_player", "_currentFireMode"];

_currentFireMode = ACE_player getVariable["ace_missileguidance_attackProfile", "JAV_TOP"];
if(_currentFireMode == "JAV_TOP") then {
    __JavelinIGUITop ctrlSetTextColor __ColorGreen;
    __JavelinIGUIDir ctrlSetTextColor __ColorGray;
} else {
    __JavelinIGUITop ctrlSetTextColor __ColorGray;
    __JavelinIGUIDir ctrlSetTextColor __ColorGreen;
};
