/*
 * Author: esteldunedain
 * Handle mouse movement over the map tool.
 *
 * Argument:
 * 0: Map Control
 * 1: Mouse position on screen coordinates
 *
 * Return value:
 * Boolean, true if event was handled
 */

#include "script_component.hpp"

params ["_control", "_mousePosX", "_mousePosY"];
TRACE_3("params",_control,_mousePosX,_mousePosY);

private ["_control", "_pos"];

GVAR(mousePosition) = _control ctrlMapScreenToWorld [_mousePosX, _mousePosY];
GVAR(mousePosition) set [2, 0];  //convert 2d pos to 3d

// If cannot draw then exit
if !(call FUNC(canDraw)) exitWith {
    // If was drawing, cancel
    if (GVAR(drawing_isDrawing)) then {
        call FUNC(cancelDrawing);
    };
    false
};

// Handle drawing
if (GVAR(drawing_isDrawing)) exitWith {
    GVAR(drawing_tempLineMarker) set [2, GVAR(mousePosition)];
    TRACE_1("updating line pos",GVAR(mousePosition));
    GVAR(drawing_tempLineMarker) call FUNC(updateLineMarker);
    false
};

// Handle Map tools
if (GVAR(mapTool_Shown) == 0) exitWith {false};

// Translation
if (GVAR(mapTool_isDragging)) exitWith {
    GVAR(mapTool_pos) set [0, (GVAR(mapTool_startPos) select 0) + (GVAR(mousePosition) select 0) - (GVAR(mapTool_startDragPos) select 0)];
    GVAR(mapTool_pos) set [1, (GVAR(mapTool_startPos) select 1) + (GVAR(mousePosition) select 1) - (GVAR(mapTool_startDragPos) select 1)];

    true
};

// Rotation
if (GVAR(mapTool_isRotating)) exitWith {
    private "_angle";
    // Get new angle
    _angle =  (180 + ((GVAR(mousePosition) select 0) - (GVAR(mapTool_startPos) select 0)) atan2 ((GVAR(mousePosition) select 1) - (GVAR(mapTool_startPos) select 1)) mod 360);
    GVAR(mapTool_angle) = GVAR(mapTool_startAngle) + _angle - GVAR(mapTool_startDragAngle);

    true
};

false
