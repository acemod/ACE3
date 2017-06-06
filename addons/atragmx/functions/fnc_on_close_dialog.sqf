/*
 * Author: ACE
 * On close Dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

uiNamespace setVariable ['ATragMX_Display', nil];
GVAR(active) = false;
[GVAR(DialogPFH)] call CBA_fnc_removePerFrameHandler;
