#include "script_component.hpp"
/*
 * Author: ACE-Team
 * On close Dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_on_close_dialog
 *
 * Public: No
 */

uiNamespace setVariable ['ATragMX_Display', nil];
GVAR(active) = false;
[GVAR(DialogPFH)] call CBA_fnc_removePerFrameHandler;
