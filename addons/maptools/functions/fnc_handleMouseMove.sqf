/*
 * Author: esteldunedain
 * Handle mouse movement over the map tool.
 *
 * Arguments:
 * 0: Map Control <CONTROL>
 * 1: Mouse position on screen coordinates <ARRAY>
 *
 * Return Value:
 * true if event was handled <BOOL>
 *
 * Example:
 * [CONTROL, [0, 5, 1]] call ACE_maptools_fnc_handleMouseMove
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_control", "_mousePosX", "_mousePosY"];
TRACE_3("params",_control,_mousePosX,_mousePosY);

// If have no map tools, then exit
if (((isNull ACE_player) || {!("ACE_MapTools" in items ACE_player)})) exitWith {
    false
};

// If map tools not shown, then exit
if (GVAR(mapTool_Shown) == 0) exitWith {false};

private _mousePosition = _control ctrlMapScreenToWorld [_mousePosX, _mousePosY];

// Translation
if (GVAR(mapTool_isDragging)) exitWith {
    GVAR(mapTool_pos) set [0, (GVAR(mapTool_startPos) select 0) + (_mousePosition select 0) - (GVAR(mapTool_startDragPos) select 0)];
    GVAR(mapTool_pos) set [1, (GVAR(mapTool_startPos) select 1) + (_mousePosition select 1) - (GVAR(mapTool_startDragPos) select 1)];

    true
};

// Rotation
if (GVAR(mapTool_isRotating)) exitWith {
    // Get new angle
    private _angle =  (180 + ((_mousePosition select 0) - (GVAR(mapTool_startPos) select 0)) atan2 ((_mousePosition select 1) - (GVAR(mapTool_startPos) select 1)) mod 360);
    GVAR(mapTool_angle) = GVAR(mapTool_startAngle) + _angle - GVAR(mapTool_startDragAngle);

    true
};

false
