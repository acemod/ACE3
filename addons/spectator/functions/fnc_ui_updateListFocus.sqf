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

// Don't update list when in location mode or focus is a location
if (!GVAR(camOnLocation) && {GVAR(uiListType) != LIST_LOCATIONS}) then {
    CTRL_LIST tvSetCurSel ([[GVAR(camTarget)] call BIS_fnc_objectVar] call FUNC(ui_getTreeDataIndex));
};
