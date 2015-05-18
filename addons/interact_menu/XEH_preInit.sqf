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

GVAR(foundActions) = [];
GVAR(lastTimeSearchedActions) = -1000;


// Init CAManBase menus
["CAManBase"] call FUNC(compileMenu);
["CAManBase"] call FUNC(compileMenuSelfAction);

ADDON = true;
