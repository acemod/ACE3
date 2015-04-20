/*
 * Author: NouberNou and esteldunedain
 * Handle interactions key down
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

EXPLODE_1_PVT(_this,_menuType);

if (GVAR(openedMenuType) == _menuType) exitWith {true};

while {dialog} do {
    closeDialog 0;
};

if (_menuType == 0) then {
    GVAR(keyDown) = true;
    GVAR(keyDownSelfAction) = false;
} else {
    GVAR(keyDown) = false;
    GVAR(keyDownSelfAction) = true;
};
GVAR(keyDownTime) = diag_tickTime;
GVAR(openedMenuType) = _menuType;
GVAR(lastTimeSearchedActions) = -1000;

GVAR(useCursorMenu) = (vehicle ACE_player != ACE_player) ||
                      visibleMap ||
                      {(_menuType == 1) && {(isWeaponDeployed ACE_player) || GVAR(AlwaysUseCursorSelfInteraction) || {cameraView == "GUNNER"}}};
if (GVAR(useCursorMenu)) then {
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

["interactMenuOpened", [_menuType]] call EFUNC(common,localEvent);

true
