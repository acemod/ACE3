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
    while {dialog} do {closeDialog 0};

    GVAR(keyDownSelfAction) = true;
    GVAR(keyDown) = false;
    GVAR(keyDownTime) = diag_tickTime;

    ["interactMenuOpened", [1]] call EFUNC(common,localEvent);

    GVAR(useCursorMenu) = (vehicle ACE_player != ACE_player) || GVAR(AlwaysUseCursorSelfInteraction) || visibleMap;

    if (GVAR(useCursorMenu)) then {
        closeDialog 0;
        createDialog QGVAR(cursorMenu);
        // The dialog sets:
        // uiNamespace getVariable QGVAR(dlgCursorMenu);
        // uiNamespace getVariable QGVAR(cursorMenuOpened);
        ctrlEnable [91921, true];
        ((finddisplay 91919) displayctrl 91921) ctrlAddEventHandler ["MouseMoving", {
            GVAR(cursorPos) = [_this select 1, _this select 2, 0];
        }];
        setMousePosition [0.5, 0.5];

    };

    GVAR(selfMenuOffset) = ((positionCameraToWorld [0, 0, 2]) call EFUNC(common,positionToASL)) vectorDiff
                           ((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL));
};
true
