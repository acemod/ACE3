/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to update the list focus
 *
 * Public: No
 */

#include "script_component.hpp"

// Don't update list when in location mode or focus is a location
if (GVAR(uiVisible) && {!GVAR(camOnLocation)} && {GVAR(uiListType) != LIST_LOCATIONS}) then {
    CTRL_LIST tvSetCurSel ([[GVAR(camTarget)] call BIS_fnc_objectVar] call FUNC(ui_getTreeDataIndex));
};
