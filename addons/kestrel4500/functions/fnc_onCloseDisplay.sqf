#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Called if Kestrel Display is closed
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_onCloseDisplay
 *
 * Public: No
 */

uiNamespace setVariable ['RscKestrel4500', nil];
GVAR(Overlay) = false;
