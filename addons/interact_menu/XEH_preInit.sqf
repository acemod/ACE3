#include "script_component.hpp"

ADDON = false;

PREP(addAction);
PREP(compileMenu);
PREP(compileMenuSelfAction);
PREP(keyDown);
PREP(keyDownSelfAction);
PREP(keyUp);
PREP(keyUpSelfAction);
PREP(probe);
PREP(removeAction);
PREP(render);
PREP(renderIcon);
PREP(renderMenu);
PREP(rotateVectLine);
PREP(rotateVectLineGetMap);

GVAR(toRender) = [];

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(keyDownTime) = 0;

GVAR(lastTime) = diag_tickTime;
GVAR(rotationAngle) = 0;

GVAR(selectedAction) = {};
GVAR(actionSelected) = false;
GVAR(selectedTarget) = objNull;

GVAR(filter) = [];

GVAR(menuDepthPath) = [];
GVAR(renderDepth) = 0;
GVAR(lastRenderDepth) = 0;
GVAR(vecLineMap) = [];
GVAR(lastPos) = [0,0,0];

GVAR(currentOptions) = [];

GVAR(lastPath) = [];

GVAR(expanded) = false;

GVAR(maxRenderDepth) = 0;
GVAR(startHoverTime) = diag_tickTime;
GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

GVAR(objectActionsHash) = HASH_CREATE;

GVAR(uidCounter) = 0;

ADDON = true;
