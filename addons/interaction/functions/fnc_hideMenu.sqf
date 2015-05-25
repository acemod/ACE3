/*
 * Author: Garth de Wet (LH)
 * Closes the Interaction menu
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_hideMenu
 *
 * Public: No
 */
#include "script_component.hpp"

closeDialog 0;
(findDisplay 1713999) closeDisplay 1;
(uiNameSpace getVariable QGVAR(Flow_Display)) closeDisplay 0;
GVAR(MainButton) = nil;
call FUNC(hideMouseHint);
