#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Called if Kestrel Dialog is closed
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_onCloseDialog
 *
 * Public: No
 */

uiNamespace setVariable ['Kestrel4500_Display', nil];
GVAR(Kestrel4500) = false;
