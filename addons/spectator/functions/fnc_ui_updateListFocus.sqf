/*
 * Author: Nelson Duarte, AACO
 * Function used to update the list focus
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(uiVisible)) then {
    CTRL_LIST tvSetCurSel ([[GVAR(camTarget)] call BIS_fnc_objectVar, IDC_LIST] call FUNC(ui_getTreeDataIndex));
};
