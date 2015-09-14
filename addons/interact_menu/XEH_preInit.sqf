#include "script_component.hpp"

ADDON = false;

PREP(addActionToClass);
PREP(addActionToObject);
PREP(addMainAction);
PREP(compileMenu);
PREP(compileMenuSelfAction);
PREP(compileMenuZeus);
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
PREP(userActions_addHouseActions);
PREP(userActions_getHouseActions);

// Event handlers for all interact menu controls
DFUNC(handleMouseMovement) = {
    if (GVAR(cursorKeepCentered)) then {
        params ["", "_xCord", "_yCord"];
        private ["_distanceFromCenter"];
        _offsetFromCenter = [_xCord, _yCord, 0] vectorDiff [0.5, 0.5, 0];
        if ((vectorMagnitude _offsetFromCenter) > 0.001) then {
            GVAR(cursorPos) = GVAR(cursorPos) vectorAdd _offsetFromCenter;
            setMousePosition [0.5, 0.5];
        };
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

GVAR(lastTime) = ACE_diagTime;
GVAR(rotationAngle) = 0;

GVAR(selectedAction) = [[],[]];
GVAR(actionSelected) = false;
GVAR(selectedTarget) = objNull;

GVAR(menuDepthPath) = [];
GVAR(lastPos) = [0,0,0];

GVAR(currentOptions) = [];

GVAR(lastPath) = [];

GVAR(expanded) = false;

GVAR(startHoverTime) = ACE_diagTime;
GVAR(expandedTime) = ACE_diagTime;
GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

GVAR(collectedActionPoints) = [];
GVAR(foundActions) = [];
GVAR(lastTimeSearchedActions) = -1000;


// Init CAManBase menus
["CAManBase"] call FUNC(compileMenu);
["CAManBase"] call FUNC(compileMenuSelfAction);

// Init zeus menu
[] call FUNC(compileMenuZeus);

ADDON = true;
