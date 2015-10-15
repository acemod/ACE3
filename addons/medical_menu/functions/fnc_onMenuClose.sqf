/*
 * Author: joko // Jonas
 * Handle medical menu closed
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_medical_menu_onMenuClosed
 *
 * Public: No
 */
#include "script_component.hpp"

if (EGVAR(interact_menu,menuBackground)==1) then {[QGVAR(id), false] call EFUNC(common,blurScreen);};
if (EGVAR(interact_menu,menuBackground)==2) then {(uiNamespace getVariable [QEGVAR(interact_menu,menuBackground), displayNull]) closeDisplay 0;};

[GVAR(MenuPFHID)] call CBA_fnc_removePerFrameHandler;
