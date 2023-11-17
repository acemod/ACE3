#include "..\script_component.hpp"
/*
 * Author: esteldunedain, LorenLuke
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
 * [CONTROL, [0, 5]] call ACE_maptools_fnc_handleMouseMove
 *
 * Public: No
 */

params ["_control", "_mousePosX", "_mousePosY"];
TRACE_3("params",_control,_mousePosX,_mousePosY);

// If have no map tools, then exit
if ((isNull ACE_player) || {!(("ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems))) || {"ACE_PlottingBoard" in (ACE_player call EFUNC(common,uniqueItems))})}) exitWith {
    false
};

// If map tools not shown, then exit
if ( (GVAR(mapTool_Shown) == 0) && (GVAR(plottingBoard_Shown) == 0) ) exitWith {false};

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
    private _angle = (180 + ((_mousePosition select 0) - (GVAR(mapTool_startPos) select 0)) atan2 ((_mousePosition select 1) - (GVAR(mapTool_startPos) select 1)) mod 360);
    GVAR(mapTool_angle) = GVAR(mapTool_startAngle) + _angle - GVAR(mapTool_startDragAngle);

    true
};



// Translation
if (GVAR(plottingBoard_isDragging)) exitWith {
    GVAR(plottingBoard_pos) set [0, (GVAR(plottingBoard_startPos) select 0) + (_mousePosition select 0) - (GVAR(plottingBoard_startDragPos) select 0)];
    GVAR(plottingBoard_pos) set [1, (GVAR(plottingBoard_startPos) select 1) + (_mousePosition select 1) - (GVAR(plottingBoard_startDragPos) select 1)];

    true
};

// Rotation
if (GVAR(plottingBoard_isRotating) > -1) exitWith {
    // Get new angle

    private _angle = (180 + ((_mousePosition select 0) - (GVAR(plottingBoard_startPos) select 0)) atan2 ((_mousePosition select 1) - (GVAR(plottingBoard_startPos) select 1)) mod 360);
    private _returnAngle = GVAR(plottingBoard_startAngle) + _angle - GVAR(plottingBoard_startDragAngle);

    switch (GVAR(plottingBoard_isRotating)) do {
        case (0): {GVAR(plottingBoard_angle) = _returnAngle};
        case (1): {GVAR(plottingBoard_acrylicAngle) = _returnAngle};
        case (2): {GVAR(plottingBoard_rulerAngle) = _returnAngle};
    };

    true
};

false
