#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Handles closing the Medical Menu. Called from onUnload event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_onMenuClose
 *
 * Public: No
 */

if (EGVAR(interact_menu,menuBackground) == 1) then {[QGVAR(id), false] call EFUNC(common,blurScreen)};
if (EGVAR(interact_menu,menuBackground) == 2) then {(uiNamespace getVariable [QEGVAR(interact_menu,menuBackground), displayNull]) closeDisplay 0};

GVAR(pendingReopen) = false;
GVAR(menuPFH) call CBA_fnc_removePerFrameHandler;
GVAR(menuPFH) = -1;
