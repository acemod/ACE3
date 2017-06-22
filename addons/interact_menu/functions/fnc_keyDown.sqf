/*
 * Author: NouberNou and esteldunedain
 * Handle interactions key down
 *
 * Arguments:
 * 0: Type of key: 0 interaction / 1 self interaction <NUMBER>
 *
 * Return Value:
 * true <BOOL>
 *
 * Example:
 * [0] call ACE_interact_menu_fnc_keyDown
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
GVAR(keyDownTime) = diag_tickTime;
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
    (finddisplay 91919) displayAddEventHandler ["KeyDown", {
        // Handle the escape key being pressed with menu open:
        if ((_this select [1,4]) isEqualTo [1,false,false,false]) exitWith { // escape key with no modifiers
            [displayNull] call FUNC(handleEscapeMenu);
        };
        [_this,'keydown'] call CBA_events_fnc_keyHandler;
    }];
    // The dialog sets:
    // uiNamespace getVariable QGVAR(dlgCursorMenu);
    // uiNamespace getVariable QGVAR(cursorMenuOpened);
    GVAR(cursorPos) = [0.5,0.5,0];

    private _ctrl = (findDisplay 91919) ctrlCreate ["RscStructuredText", 9922];
    _ctrl ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
    _ctrl ctrlCommit 0;

    // handles Mouse moving and LMB in cursor mode when action on keyrelease is disabled
    ((finddisplay 91919) displayctrl 9922) ctrlAddEventHandler ["MouseMoving", DFUNC(handleMouseMovement)];
    ((finddisplay 91919) displayctrl 9922) ctrlAddEventHandler ["MouseButtonDown", DFUNC(handleMouseButtonDown)];
    setMousePosition [0.5, 0.5];
} else {
    if (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]) then {
        (findDisplay 91919) closeDisplay 2;
    };
};

GVAR(selfMenuOffset) = (AGLtoASL (positionCameraToWorld [0, 0, 2])) vectorDiff (AGLtoASL (positionCameraToWorld [0, 0, 0]));

//Auto expand the first level when self, mounted vehicle or zeus (skips the first animation as there is only one choice)
if (GVAR(openedMenuType) == 0) then {
    if (isNull curatorCamera) then {
        if (vehicle ACE_player != ACE_player) then {
            GVAR(menuDepthPath) = [["ACE_SelfActions", (vehicle ACE_player)]];
            GVAR(expanded) = true;
            GVAR(expandedTime) = diag_tickTime;
            GVAR(lastPath) = +GVAR(menuDepthPath);
            GVAR(startHoverTime) = -1000;
        };
    } else {
        GVAR(menuDepthPath) = [["ACE_ZeusActions", (getAssignedCuratorLogic player)]];
        GVAR(expanded) = true;
        GVAR(expandedTime) = diag_tickTime;
        GVAR(lastPath) = +GVAR(menuDepthPath);
        GVAR(startHoverTime) = -1000;
    };
} else {
    GVAR(menuDepthPath) = [["ACE_SelfActions", ACE_player]];
    GVAR(expanded) = true;
    GVAR(expandedTime) = diag_tickTime;
    GVAR(lastPath) = +GVAR(menuDepthPath);
    GVAR(startHoverTime) = -1000;
};

["ace_interactMenuOpened", [_menuType]] call CBA_fnc_localEvent;

//Remove the old "DefaultAction" action event handler if it already exists
GVAR(blockDefaultActions) params [["_player", objNull], ["_ehid", -1]];
TRACE_2("blockDefaultActions",_player,_ehid);
if (!isNull _player) then {
    [_player, "DefaultAction", _ehid] call EFUNC(common,removeActionEventHandler);
    GVAR(blockDefaultActions) = [];
};
//Add the "DefaultAction" action event handler
if (alive ACE_player) then {
    private _ehid = [ACE_player, "DefaultAction", {GVAR(openedMenuType) >= 0}, {
        if (!GVAR(actionOnKeyRelease) && GVAR(actionSelected)) then {
            [GVAR(openedMenuType),true] call FUNC(keyUp);
        };
    }] call EFUNC(common,addActionEventHandler);
    TRACE_2("Added",ACE_player,_ehid);
    GVAR(blockDefaultActions) = [ACE_player, _ehid];
};

GVAR(firstCursorTarget) = objNull;
GVAR(firstCursorTargetPos) = [0,0,0];
//If user has option selected, move Main Actions to cursor position on the vehicle they are looking at (only unmounted, non-self, non-zeus)
if (GVAR(moveMainInteractionToCursor) && {vehicle ACE_player == ACE_player} && {GVAR(openedMenuType) == 0} && {isNull curatorCamera}) then {
    private _cursorTargets = lineIntersectsSurfaces [(AGLtoASL positionCameraToWorld [0,0,0]), (AGLtoASL positionCameraToWorld [0,0,10]), ACE_player];
    TRACE_1("Checking for cursor target",_cursorTargets);
    if (_cursorTargets isEqualTo []) exitWith {};
    (_cursorTargets select 0) params ["_intsectPosASL", "", "_target"]; //We need variable `_target` set for the actionPosition call
    if (isNull _target) exitWith {TRACE_1("Ignoring Terrain (null)",_target);};

    //Ignore Man (confusing, and would have trouble finding a free spot)
    if (_target isKindOf "CAManBase") exitWith {TRACE_1("Ignoring Man",_target);};

    private _interestModelPos = _target worldToModelVisual (ASLtoAGL _intsectPosASL);
    private _classActions = missionNamespace getVariable [(format [QGVAR(Act_%1), typeOf _target]), []];

    //Check for existance of ACE_MainActions and get it's distance from center
    private _originalMainDistance = -1;
    {
        if ((count _x) > 0) then {
            _x params ["_baseAction"];
            _baseAction params ["_actionName", "", "", "", "", "", "", "_positionFnc"];
            if (_actionName == "ACE_MainActions") then {
                private _actionPosition = call _positionFnc;
                private _screenPos = worldToScreen (_target modelToWorldVisual _actionPosition);
                _originalMainDistance = if (_screenPos isEqualTo []) then {999} else {_screenPos distance2d [0.5,0.5]};
            };
        };
    } forEach _classActions;
    if (_originalMainDistance == -1) exitWith {
        TRACE_1("Object Does Not Have Main Action, ignoring",_originalMainDistance);
    };

    while {
        private _interestScreenPos = worldToScreen (_target modelToWorldVisual _interestModelPos);
        TRACE_3("testing",_interestModelPos,_interestScreenPos,_originalMainDistance);
        //If interest pos moved off screen, or the original was better then don't change anything
        if ((_interestScreenPos isEqualTo []) || {(_interestScreenPos distance2d [0.5, 0.5]) > _originalMainDistance}) exitWith {
            TRACE_1("interest point bad or original better",_interestScreenPos);
            _target = objNull;
            false
        };

        private _interestOverlapsOtherAction = false;
        { //Check for overlap with all other class interaction points (anything not in MainActions)
            scopeName "checkForOverlap";
            if ((count _x) > 0) then {
                _x params ["_baseAction"];
                _baseAction params ["_actionName", "", "", "", "", "", "", "_positionFnc"];
                if (_actionName != "ACE_MainActions") then {
                    private _actionPosition = call _positionFnc;
                    private _screenPos = worldToScreen (_target modelToWorldVisual _actionPosition);
                    private _distanceFromCenter = if (_screenPos isEqualTo []) then {999} else {_screenPos distance2d _interestScreenPos};
                    if (_distanceFromCenter < 0.1) then {
                        TRACE_3("Pos Overlap",_actionName,_screenPos,_distanceFromCenter);
                        _interestOverlapsOtherAction = true;
                        breakOut "checkForOverlap";
                    };
                };
            };
        } forEach _classActions;

        _interestOverlapsOtherAction
    } do {
        _interestModelPos = _interestModelPos vectorAdd [0,0,0.02];
        TRACE_1("Moving Pos Up",_interestModelPos);
    };

    if (!isNull _target) then {
        TRACE_2("Setting New Main Interaction Pos",_target,_originalMainDistance);
        GVAR(firstCursorTarget) = _target;
        GVAR(firstCursorTargetPos) = _interestModelPos;
    };
};

true
