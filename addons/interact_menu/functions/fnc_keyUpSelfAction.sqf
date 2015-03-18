/*
 * Author: NouberNou
 * Handle self action key up
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

if (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
    closeDialog 0;
};

if(GVAR(actionSelected)) then {
    this = GVAR(selectedTarget);
    _player = ACE_Player;
    _target = GVAR(selectedTarget);
    [GVAR(selectedTarget), ACE_player] call GVAR(selectedStatement);
};

if (GVAR(keyDownSelfAction)) then {
    GVAR(keyDownSelfAction) = false;
    ["interactMenuClosed", [1]] call EFUNC(common,localEvent);
};

GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];
true
