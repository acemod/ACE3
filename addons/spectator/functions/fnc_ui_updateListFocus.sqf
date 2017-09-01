/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to update the list current selection
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateListFocus
 *
 * Public: No
 */

#include "script_component.hpp"

CTRL_LIST tvSetCurSel ([[GVAR(camFocus)] call BIS_fnc_objectVar] call FUNC(ui_getTreeDataIndex));
