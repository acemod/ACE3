/*
 * Author: NouberNou
 * Handle interaction key down
 *
 * Argument:
 * None
 *
 * Return value:
 * true <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

if(!GVAR(keyDown)) then {
    GVAR(keyDown) = true;
    GVAR(keyDownTime) = diag_tickTime;
};
true
