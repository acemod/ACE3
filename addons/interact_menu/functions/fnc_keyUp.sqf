/*
 * Author: NouberNou
 * Handle interaction key up
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

if(GVAR(actionSelected)) then {
    this = GVAR(selectedTarget);
    _player = ACE_Player;
    _target = GVAR(selectedTarget);
    [GVAR(selectedTarget), ACE_player, (GVAR(selectedAction) select 0) select 9] call GVAR(selectedStatement);
};

if (GVAR(keyDown)) then {
    GVAR(keyDown) = false;
    ["interactMenuClosed", [0]] call EFUNC(common,localEvent);
};

GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];
true
