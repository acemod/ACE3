#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(ActNamespace) = [] call CBA_fnc_createNamespace;
GVAR(ActSelfNamespace) = [] call CBA_fnc_createNamespace;

// Event handlers for all interact menu controls
DFUNC(handleMouseMovement) = {
    if (GVAR(cursorKeepCentered)) then {
        GVAR(cursorPos) = GVAR(cursorPos) vectorAdd [_this select 1, _this select 2, 0] vectorDiff [0.5, 0.5, 0];
        setMousePosition [0.5, 0.5];
    } else {
        GVAR(cursorPos) = [_this select 1, _this select 2, 0];
    };
};
DFUNC(handleMouseButtonDown) = {
    params ["", "_button"];

    if (GVAR(useDetachedCursorMenu)) then {
        if (GVAR(dettachedMenuBasePath) isEqualTo []) then {
            if (_button == 0 && GVAR(actionSelected)) then {
                // Detach the menu to render the selected action
                GVAR(dettachedMenuBasePath) = +GVAR(lastPath);
                setMousePosition [0.50, 0.5];
                // handleMouseMovement is launched after handleMouseButtonDown and it returns the former mouse position
                // GVAR(cursorPos) needs to be overriden manually after that
                [{GVAR(cursorPos) = [0.5, 0.5, 0]}, []] call CBA_fnc_execNextFrame;
                GVAR(menuDepthPath) = +GVAR(lastPath);
                GVAR(expanded) = true;
                GVAR(expandedTime) = diag_tickTime-1000;
                GVAR(startHoverTime) = -1000;
            };
        } else {
            if (_button == 1) exitWith {
                // Close the detached menu
                GVAR(dettachedMenuBasePath) = [];
            };
            // Only terminate the menu if an action with an statement was clicked
            if (GVAR(actionSelected)) then {
                private _actionData = GVAR(selectedAction) select 0;
                if !(_actionData select 3 isEqualTo {}) then {
                    if !(GVAR(actionOnKeyRelease)) then {
                        [GVAR(openedMenuType),true] call FUNC(keyUp);
                    };
                };
            };
        };
    } else {
        if !(GVAR(actionOnKeyRelease)) then {
            [GVAR(openedMenuType),true] call FUNC(keyUp);
        };
    };
};
GVAR(useDetachedCursorMenu) = false;
GVAR(dettachedMenuBasePath) = [];

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(keyDownTime) = 0;
GVAR(openedMenuType) = -1;

GVAR(lastTime) = diag_tickTime;
GVAR(rotationAngle) = 0;

GVAR(selectedAction) = [[],[]];
GVAR(actionSelected) = false;
GVAR(selectedTarget) = objNull;

GVAR(menuDepthPath) = [];
GVAR(lastPos) = [0,0,0];

GVAR(currentOptions) = [];

GVAR(lastPath) = [];

GVAR(expanded) = false;

GVAR(startHoverTime) = diag_tickTime;
GVAR(expandedTime) = diag_tickTime;

// reset on mission load
addMissionEventHandler ["Loaded", {
    GVAR(startHoverTime) = 0;
    GVAR(expandedTime) = 0;
}];

GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

GVAR(collectedActionPoints) = [];
GVAR(foundActions) = [];
GVAR(lastTimeSearchedActions) = -1000;

// Init zeus menu
[] call FUNC(compileMenuZeus);

ADDON = true;
