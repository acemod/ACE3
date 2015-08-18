/*
 * Author: esteldunedain
 * Handle mouse buttons.
 *
 * Argument:
 * 0: 1 if mouse down down, 0 if mouse button up (Number)
 * 1: Parameters of the mouse button event
 *
 * Return value:
 * Boolean, true if event was handled
 */

#include "script_component.hpp"

params ["_dir", "_params"];
_params params ["_control", "_button", "_screenPosX", "_screenPosY", "_shiftKey", "_ctrlKey", "_altKey"];

private["_gui", "_handled", "_marker", "_pos"];

_handled = false;

// If it's not a left button event, exit
if (_button != 0) exitWith {_handled};

// If releasing
if ((_dir != 1) && {(GVAR(mapTool_isDragging) || GVAR(mapTool_isRotating))}) exitWith {
    GVAR(mapTool_isDragging) = false;
    GVAR(mapTool_isRotating) = false;
    _handled = true;
    _handled
};

// If clicking
if (_dir == 1) exitWith {

    if !(call FUNC(canDraw)) exitWith {_handled = false;};

    // Transform mouse screen position to coordinates
    _pos  = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
    _pos set [count _pos, 0];

    if (GVAR(drawing_isDrawing)) exitWith {
        // Already drawing -> Add tempLineMarker to permanent list
        if (GVAR(drawing_syncMarkers)) then {
            deleteMarkerLocal (GVAR(drawing_tempLineMarker) select 0);
            // [GVAR(drawing_tempLineMarker), "FUNC(addLineMarker)", 2] call EFUNC(common,execRemoteFnc);
            ["drawing_addLineMarker", GVAR(drawing_tempLineMarker)] call EFUNC(common,globalEvent);
            // Log who drew on the briefing screen
            (text format ["[ACE] Server: Player %1 drew on the briefing screen", profileName]) call EFUNC(common,serverLog);
        } else {
            GVAR(drawing_tempLineMarker) call FUNC(updateLineMarker);
            GVAR(drawing_lineMarkers) pushBack (+GVAR(drawing_tempLineMarker));
        };
        GVAR(drawing_tempLineMarker) = [];
        GVAR(drawing_isDrawing) = false;
        _handled = true;
    };

    if (_altKey) exitWith {
        // Start drawing
        GVAR(drawing_isDrawing) = true;
        // Create tempLineMarker
        _gui = format ["%1%2%3%4", random (100), random (100), random (100), random (100)];
        GVAR(drawing_tempLineMarker) = [_gui, + _pos, + _pos, GVAR(drawing_drawColor)];
        _marker = createMarkerLocal [_gui, [0,0]];
        GVAR(drawing_tempLineMarker) call FUNC(updateLineMarker);
        _handled = true;
    };

    GVAR(mapTool_isDragging) = false;
    GVAR(mapTool_isRotating) = false;

    // If no map tool marker then exit
    if (GVAR(mapTool_Shown) == 0) exitWith {_handled = false;};

    // Check if clicking the maptool
    if (_pos call FUNC(isInsideMapTool)) exitWith {
        // Store data for dragging
        GVAR(mapTool_startPos) = + GVAR(mapTool_pos);
        GVAR(mapTool_startDragPos) = + _pos;
        if (_ctrlKey) then {
            // Store data for rotating
            GVAR(mapTool_startAngle) = + GVAR(mapTool_angle);
            GVAR(mapTool_startDragAngle) = (180 + ((GVAR(mapTool_startDragPos) select 0) - (GVAR(mapTool_startPos) select 0)) atan2 ((GVAR(mapTool_startDragPos) select 1) - (GVAR(mapTool_startPos) select 1)) mod 360);
            // Start rotating
            GVAR(mapTool_isRotating) = true;
        } else {
            // Start dragging
            GVAR(mapTool_isDragging) = true;
        };
        _handled = true;
    };
    
    _handled
};

_handled
