#include "script_component.hpp"
/*
 * Author: NouberNou and esteldunedain
 * Handle interactions key up
 *
 * Arguments:
 * 0: Type of key: 0 interaction / 1 self interaction <NUMBER>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [1] call ACE_interact_menu_fnc_keyUp
 *
 * Public: No
 */

params ["_menuType", "_calledByClicking"];

// Exit if there's no menu opened
if (GVAR(openedMenuType) < 0) exitWith {true};

if (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
    (findDisplay 91919) closeDisplay 2;
};

if(GVAR(actionSelected)) then {
    this = GVAR(selectedTarget);

    private _player = ACE_Player;
    private _target = GVAR(selectedTarget);

    // Clear the conditions caches
    [QGVAR(clearConditionCaches), []] call CBA_fnc_localEvent;

    // exit scope if selecting an action on key release is disabled
    if (!(GVAR(actionOnKeyRelease)) && !_calledByClicking) exitWith {};

    // Check the action conditions
    private _actionData = GVAR(selectedAction) select 0;
    if ([_target, _player, _actionData select 6] call (_actionData select 4)) then {
        // Call the statement
        [_target, _player, _actionData select 6] call (_actionData select 3);

        // Clear the conditions caches again if the action was performed
        [QGVAR(clearConditionCaches), []] call CBA_fnc_localEvent;
    };
};

["ace_interactMenuClosed", [GVAR(openedMenuType)]] call CBA_fnc_localEvent;

//Remove the "DefaultAction" action event handler
GVAR(blockDefaultActions) params [["_player", objNull], ["_ehid", -1]];
TRACE_2("blockDefaultActions",_player,_ehid);
if (!isNull _player) then {
    [_player, "DefaultAction", _ehid] call EFUNC(common,removeActionEventHandler);
    GVAR(blockDefaultActions) = [];
};

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(openedMenuType) = -1;

GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];

true
