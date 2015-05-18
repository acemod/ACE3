#include "script_component.hpp"

ADDON = false;

PREP(addActionToClass);
PREP(addActionToObject);
PREP(compileMenu);
PREP(compileMenuSelfAction);
PREP(collectActiveActionTree);
PREP(createAction);
PREP(ctrlSetParsedTextCached);
PREP(findActionNode);
PREP(handlePlayerChanged);
PREP(isSubPath);
PREP(keyDown);
PREP(keyUp);
PREP(removeActionFromClass);
PREP(removeActionFromObject);
PREP(render);
PREP(renderActionPoints);
PREP(renderBaseMenu);
PREP(renderIcon);
PREP(renderMenu);
PREP(renderSelector);
PREP(setupTextColors);
PREP(splitPath);

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
    if !(GVAR(actionOnKeyRelease)) then {
        [GVAR(openedMenuType),true] call FUNC(keyUp);
    };
};

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
GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

GVAR(collectedActionPoints) = [];
GVAR(foundActions) = [];
GVAR(lastTimeSearchedActions) = -1000;


// Init CAManBase menus
["CAManBase"] call FUNC(compileMenu);
["CAManBase"] call FUNC(compileMenuSelfAction);

ADDON = true;
