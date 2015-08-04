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

params ["_menuType"];

if (GVAR(openedMenuType) == _menuType) exitWith {true};

// Conditions: canInteract (these don't apply to zeus)
if ((isNull curatorCamera) && {
    !([ACE_player, objNull, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering", "isNotSitting"]] call EFUNC(common,canInteractWith))
}) exitWith {false};

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
GVAR(keyDownTime) = ACE_diagTime;
GVAR(openedMenuType) = _menuType;
GVAR(lastTimeSearchedActions) = -1000;
GVAR(ParsedTextCached) = [];

GVAR(useCursorMenu) = (vehicle ACE_player != ACE_player) ||
                      visibleMap ||
                      (!isNull curatorCamera) ||
                      {(_menuType == 1) && {(isWeaponDeployed ACE_player) || GVAR(AlwaysUseCursorSelfInteraction) || {cameraView == "GUNNER"}}} ||
                      {(_menuType == 0) && GVAR(AlwaysUseCursorInteraction)};

// Delete existing controls in case there's any left
GVAR(iconCount) = 0;
for "_i" from 0 to (count GVAR(iconCtrls))-1 do {
    ctrlDelete (GVAR(iconCtrls) select _i);
    GVAR(ParsedTextCached) set [_i, ""];
};
GVAR(iconCtrls) resize GVAR(iconCount);

if (GVAR(useCursorMenu)) then {
    // Don't close zeus interface if open
    if (isNull curatorCamera) then {
        (findDisplay 46) createDisplay QGVAR(cursorMenu); //"RscCinemaBorder";//
    } else {
        createDialog QGVAR(cursorMenu);
    };
    (finddisplay 91919) displayAddEventHandler ["KeyUp", {[_this,'keyup'] call CBA_events_fnc_keyHandler}];
    (finddisplay 91919) displayAddEventHandler ["KeyDown", {[_this,'keydown'] call CBA_events_fnc_keyHandler}];
    // The dialog sets:
    // uiNamespace getVariable QGVAR(dlgCursorMenu);
    // uiNamespace getVariable QGVAR(cursorMenuOpened);
    GVAR(cursorPos) = [0.5,0.5,0];

    _ctrl = (findDisplay 91919) ctrlCreate ["RscStructuredText", 9922];
    _ctrl ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
    _ctrl ctrlCommit 0;

    // handles Mouse moving and LMB in cursor mode when action on keyrelease is disabled
    ((finddisplay 91919) displayctrl 9922) ctrlAddEventHandler ["MouseMoving", DFUNC(handleMouseMovement)];
    ((finddisplay 91919) displayctrl 9922) ctrlAddEventHandler ["MouseButtonDown", DFUNC(handleMouseButtonDown)];
    setMousePosition [0.5, 0.5];
};

GVAR(selfMenuOffset) = ((positionCameraToWorld [0, 0, 2]) call EFUNC(common,positionToASL)) vectorDiff
                       ((positionCameraToWorld [0, 0, 0]) call EFUNC(common,positionToASL));

["interactMenuOpened", [_menuType]] call EFUNC(common,localEvent);

true
