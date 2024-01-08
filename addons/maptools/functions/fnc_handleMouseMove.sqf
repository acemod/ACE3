#include "..\script_component.hpp"
/*
 * Author: esteldunedain, LorenLuke
 * Handle mouse movement over the map tool and plotting board.
 *
 * Arguments:
 * 0: Map control <CONTROL>
 * 1: Mouse position on screen coordinates <ARRAY>
 *
 * Return Value:
 * If the event was handled <BOOL>
 *
 * Example:
 * [CONTROL, [0, 5]] call ace_maptools_fnc_handleMouseMove
 *
 * Public: No
 */

params ["_mapCtrl", "_mousePosX", "_mousePosY"];
TRACE_3("params",_mapCtrl,_mousePosX,_mousePosY);

// If have no map tools, then exit
if (isNull ACE_player || {
    private _uniqueItems = ACE_player call EFUNC(common,uniqueItems);

    !(("ACE_MapTools" in _uniqueItems) || {"ACE_PlottingBoard" in _uniqueItems})
}) exitWith {
    false
};

// If map tools not shown, then exit
if (GVAR(mapTool_Shown) == 0 && {GVAR(plottingBoard_Shown) == 0}) exitWith {false};

private _mousePosition = _mapCtrl ctrlMapScreenToWorld [_mousePosX, _mousePosY];

// Map tools - translation
if (GVAR(mapTool_isDragging)) exitWith {
    GVAR(mapTool_pos) = GVAR(mapTool_startPos) vectorAdd _mousePosition vectorDiff GVAR(mapTool_startDragPos);

    true
};

// Map tools - rotation
if (GVAR(mapTool_isRotating)) exitWith {
    // Get new angle
    private _pos = _mousePosition vectorDiff GVAR(mapTool_startPos);
    private _angle = (_pos select 0) atan2 (_pos select 1);

    GVAR(mapTool_angle) = ((GVAR(mapTool_startAngle) + _angle - GVAR(mapTool_startDragAngle)) % 360 + 360) % 360;

    true
};

// Plotting board - translation
if (GVAR(plottingBoard_isDragging)) exitWith {
    GVAR(plottingBoard_pos) = GVAR(plottingBoard_startPos) vectorAdd _mousePosition vectorDiff GVAR(plottingBoard_startDragPos);

    true
};

// Plotting board - rotation
if (GVAR(plottingBoard_isRotating) > -1) exitWith {
    // Get new angle
    private _pos = _mousePosition vectorDiff GVAR(plottingBoard_startPos);
    private _angle = (_pos select 0) atan2 (_pos select 1);
    private _returnAngle = ((GVAR(plottingBoard_startAngle) + _angle - GVAR(plottingBoard_startDragAngle)) % 360 + 360) % 360;

    switch (GVAR(plottingBoard_isRotating)) do {
        case 0: {GVAR(plottingBoard_angle) = _returnAngle};
        case 1: {GVAR(plottingBoard_acrylicAngle) = _returnAngle};
        case 2: {GVAR(plottingBoard_rulerAngle) = _returnAngle};
    };

    true
};

false
