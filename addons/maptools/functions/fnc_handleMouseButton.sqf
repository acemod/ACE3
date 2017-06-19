/*
 * Author: esteldunedain
 * Handle mouse buttons.
 *
 * Arguments:
 * 0: 1 if mouse down down, 0 if mouse button up <Number>
 * 1: Parameters of the mouse button event <ARRAY>
 *
 * Return Value:
 * true if event was handled <BOOL>
 *
 * Example:
 * [0, [array]] call ACE_maptools_fnc_handleMouseButton
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_dir", "_params"];
_params params ["_control", "_button", "_screenPosX", "_screenPosY", "_shiftKey", "_ctrlKey", "_altKey"];
TRACE_2("params",_dir,_params);

// Using line drawing
if ((_button == 0) && {GVAR(freedrawing) || _ctrlKey}) exitWith {
    if (GVAR(freedrawing) && {_dir == 0}) then {
        GVAR(freedrawing) = false;
        GVAR(drawPosEnd) = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
        TRACE_1("Ending Line",GVAR(freedrawing),GVAR(drawPosEnd));
        [{
            if (allMapMarkers isEqualTo []) exitWith {};
            private _markerName = allMapMarkers select (count allMapMarkers - 1);
            private _markerPos = getMarkerPos _markerName;
            private _distanceCheck = _markerPos distance2d GVAR(drawPosStart);

            TRACE_3("Line Drawn",_markerName,_markerPos,_distanceCheck);

            if (_distanceCheck > 1) exitWith {WARNING("Wrong Marker!");};
            if ((count GVAR(freeDrawingData)) != 3) exitWith {TRACE_1("never touched roamer",GVAR(freeDrawingData));};

            GVAR(freeDrawingData) params ["", "_startStraightPos", "_endStraightPos"];
           _startStraightPos set [2, 0];
            _endStraightPos set [2, 0];

            // Convert marker to rectangle and change it's pos/size/dir
            _markerName setMarkerShape "RECTANGLE";

            private _difPos = _endStraightPos vectorDiff _startStraightPos;
            private _mag = vectorMagnitude _difPos;
            _markerName setMarkerPos (_startStraightPos vectorAdd (_difPos vectorMultiply 0.5));
            _markerName setMarkerSize [10, _mag / 2];
            _markerName setMarkerDir (_difPos call CBA_fnc_vectDir);

        }, []] call CBA_fnc_execNextFrame;
    } else {
        if (_ctrlKey && {_dir == 1}) then {
            GVAR(freeDrawingData) = [];
            GVAR(freedrawing) = true;
            GVAR(drawPosStart) = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
            TRACE_2("Starting Line",GVAR(freedrawing),GVAR(drawPosStart));
        } else {
            GVAR(freedrawing) = false;
            TRACE_1("weird - reseting",GVAR(freedrawing));
        };
    };
    false
};

private _handled = false;

// If it's not a left button event, exit
if (_button != 0) exitWith {_handled};

// If releasing
if (_dir != 1) then {
    if (GVAR(mapTool_isDragging) || GVAR(mapTool_isRotating)) then {
        GVAR(mapTool_isDragging) = false;
        GVAR(mapTool_isRotating) = false;
        _handled = true;
    };
} else {
    // If clicking
    if !(call FUNC(canUseMapTools)) exitWith {};

    // Transform mouse screen position to coordinates
    private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
    _pos set [count _pos, 0];

    GVAR(mapTool_isDragging) = false;
    GVAR(mapTool_isRotating) = false;

    // If no map tool marker then exit
    if (GVAR(mapTool_Shown) == 0) exitWith {};

    // Check if clicking the maptool
    if (_pos call FUNC(isInsideMapTool)) exitWith {
        // Store data for dragging
        GVAR(mapTool_startPos) = + GVAR(mapTool_pos);
        GVAR(mapTool_startDragPos) = + _pos;

        private _rotateKeyPressed = switch (GVAR(rotateModifierKey)) do {
            case (1): {_altKey};
            case (2): {_ctrlKey};
            case (3): {_shiftKey};
            default {false};
        };

        if (_rotateKeyPressed) then {
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
};

_handled
