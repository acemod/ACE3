/*
 * Author: NouberNou and esteldunedain
 * Handle interactions key up
 *
 * Argument:
 * 0: Type of key: 0 interaction / 1 self interaction <NUMBER>
 *
 * Return value:
 * true <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private "_calledByClicking";
_calledByClicking = _this select 1;

// Exit if there's no menu opened
if (GVAR(openedMenuType) < 0) exitWith {true};

if (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
    (findDisplay 91919) closeDisplay 2;
};

if(GVAR(actionSelected)) then {
    this = GVAR(selectedTarget);

    private ["_player","_target","_actionData"];
    _player = ACE_Player;
    _target = GVAR(selectedTarget);

    // Clear the conditions caches
    ["clearConditionCaches", []] call EFUNC(common,localEvent);

    // exit scope if selecting an action on key release is disabled
    if (!(GVAR(actionOnKeyRelease)) && !_calledByClicking) exitWith {};

    // Check the action conditions
    _actionData = GVAR(selectedAction) select 0;
    if ([_target, _player, _actionData select 6] call (_actionData select 4)) then {
        // Call the statement
        [_target, _player, _actionData select 6] call (_actionData select 3);

        // Clear the conditions caches again if the action was performed
        ["clearConditionCaches", []] call EFUNC(common,localEvent);
    };
};

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(openedMenuType) = -1;

GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];

["interactMenuClosed", [GVAR(openedMenuType)]] call EFUNC(common,localEvent);

true
