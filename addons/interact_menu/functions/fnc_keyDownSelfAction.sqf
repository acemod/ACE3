/*
 * Author: NouberNou
 * Handle self action key down
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

if(!GVAR(keyDownSelfAction)) then {
    GVAR(keyDownSelfAction) = true;
    GVAR(keyDown) = false;
    GVAR(keyDownTime) = diag_tickTime;

    GVAR(selfMenuOffset) = [sin getDir ACE_player, cos getDir ACE_player, 0] vectorMultiply 2;
};
true
