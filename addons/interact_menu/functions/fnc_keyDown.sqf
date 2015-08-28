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
    !([ACE_player, objNull, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering", "isNotSitting", "isNotOnLadder"]] call EFUNC(common,canInteractWith))
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

if (GVAR(menuAnimationSpeed) > 0) then {
    //Auto expand the first level when self, mounted vehicle or zeus (skips the first animation as there is only one choice)
    if (GVAR(openedMenuType) == 0) then {
        if (isNull curatorCamera) then {
            if (vehicle ACE_player != ACE_player) then {
                GVAR(menuDepthPath) = [["ACE_SelfActions", (vehicle ACE_player)]];
            };
        } else {
            GVAR(menuDepthPath) = [["ACE_ZeusActions", (getAssignedCuratorLogic player)]];
        };
    } else {
        GVAR(menuDepthPath) = [["ACE_SelfActions", ACE_player]];
    };
};                   
                       
["interactMenuOpened", [_menuType]] call EFUNC(common,localEvent);

GVAR(firstCursorTarget) = objNull;
GVAR(firstCursorTargetPos) = [0,0,0];
_cursorTargets = lineIntersectsSurfaces [(AGLtoASL positionCameraToWorld [0,0,0]), (AGLtoASL positionCameraToWorld [0,0,10]), ACE_player];
if ((count _cursorTargets) > 0) then {
    (_cursorTargets select 0) params ["_intsectPosASL", "", "_intersectObject"];

    _target = _intersectObject;
    _targetInterestPos = _intersectObject worldToModelVisual (ASLtoAGL _intsectPosASL);

    _actionsVarName = format [QGVAR(Act_%1), typeOf _intersectObject];
    _classActions = missionNamespace getVariable [_actionsVarName, []];
    _fnc_posOverlaps = {
        _return = false;
        {
            if ((count _x) > 0) then {
                _baseAction = _x select 0;
                if ((_baseAction select 0) != "ACE_MainActions") then {
                    _actionPosition = call (_baseAction select 7);
                    diag_log text format ["%1 from %2", (_actionPosition vectorDistance _targetInterestPos), _x];
                    if ((_actionPosition vectorDistance _targetInterestPos) < 0.4) then {
                        _return = true;
                    };
                };
            };
        } forEach _classActions;
        _return
    };

    while _fnc_posOverlaps do {
        _targetInterestPos = _targetInterestPos vectorAdd [0,0,0.05];
    };

    GVAR(firstCursorTarget) = _intersectObject;
    GVAR(firstCursorTargetPos) = _targetInterestPos;
};

true
