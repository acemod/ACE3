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

    // Only interact with others if on foot
    if (vehicle ACE_player != ACE_player) exitWith {};

    GVAR(keyDown) = true;
    GVAR(keyDownTime) = diag_tickTime;

    ["interact_keyDown", []] call EFUNC(common,localEvent);
};
true
