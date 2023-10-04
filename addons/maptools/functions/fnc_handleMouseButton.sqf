#include "..\script_component.hpp"
/*
 * Author: esteldunedain & LorenLuke
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

params ["_dir", "_params"];
_params params ["_control", "_button", "_screenPosX", "_screenPosY", "_shiftKey", "_ctrlKey", "_altKey"];
TRACE_2("params",_dir,_params);

// Using line drawing
if ((_button == 0) && {GVAR(freedrawing) || _ctrlKey}) exitWith {

    if (GVAR(freedrawing) && {_dir == 0}) then {
        GVAR(freedrawing) = false;
        if (_shiftKey) exitWith {
            TRACE_1("using vanilla straight line",_shiftKey);
        };
        TRACE_2("Ending Line",GVAR(freedrawing),GVAR(freeDrawingData));
        [{
            if (allMapMarkers isEqualTo []) exitWith {};
            private _markerName = allMapMarkers select (count allMapMarkers - 1);
            private _markerPos = getMarkerPos _markerName;
            private _distanceCheck = _markerPos distance2d GVAR(drawPosStart);

            TRACE_3("Line Drawn",_markerName,_markerPos,_distanceCheck);

            if (_distanceCheck > 1) exitWith {WARNING("Wrong Marker!");};

            
            if ((count GVAR(freeDrawingData)) != 3) exitWith {TRACE_1("never touched roamer",GVAR(freeDrawingData));};

            GVAR(freeDrawingData) params ["", "_startStraightPos", "_endStraightPos"];

            _markerName setMarkerPolyline [
                _startStraightPos#0, _startStraightPos#1,
                _endStraightPos#0, _endStraightPos#1
            ];
        }, []] call CBA_fnc_execNextFrame;
    } else {
        if (_ctrlKey && {_dir == 1}) then {
            private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
            GVAR(freeDrawingData) = [];
            GVAR(freedrawing) = true;
            GVAR(drawPosStart) = _pos
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
    if (GVAR(plottingBoard_isDragging) || GVAR(plottingBoard_isRotating > -1)) then {
        GVAR(plottingBoard_isDragging) = false;
        GVAR(plottingBoard_isRotating) = -1;
        _handled = true;
    };
} else {
    // If clicking
    if (call FUNC(canUseMapTools)) then {

        // Transform mouse screen position to coordinates
        private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
        _pos pushback 0;

        GVAR(mapTool_isDragging) = false;
        GVAR(mapTool_isRotating) = false;

        // If no map tool marker then exit
        if (GVAR(mapTool_Shown) != 0) then {;
            // Check if clicking the maptool
            if (_pos call FUNC(isInsideMapTool)) then {
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
    };
    
    if (call FUNC(canUsePlottingBoard)) then {
        
        // Transform mouse screen position to coordinates
        private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
        _pos pushBack 0;
        
        GVAR(plottingBoard_isDragging) = false;
        GVAR(plottingBoard_isRotating) = -1;
        
        if (GVAR(plottingBoard_Shown) != 0) then {
        
            private _click = _pos call FUNC(isInsidePlottingBoard);
            //hint str _click;
            if (_click > -1) then {

                GVAR(plottingBoard_startPos) = + GVAR(plottingBoard_pos);
                GVAR(plottingBoard_startDragPos) = + _pos;

                private _rotateKeyPressed = switch (GVAR(rotateModifierKey)) do {
                    case (1): {_altKey};
                    case (2): {_ctrlKey};
                    case (3): {_shiftKey};
                    default {false};
                };

                if (_rotateKeyPressed) then {
                    // Store data for rotating
                    private _ang = + GVAR(plottingBoard_angle);
                    switch (_click) do {
                        case (1): {_ang = GVAR(plottingBoard_acrylicAngle)};
                        case (2): {_ang = GVAR(plottingBoard_rulerAngle)};
                    };
                    
                    GVAR(plottingBoard_startAngle) = + _ang;
                    GVAR(plottingBoard_startDragAngle) = (180 + ((GVAR(plottingBoard_startDragPos) select 0) - (GVAR(plottingBoard_startPos) select 0)) atan2 ((GVAR(plottingBoard_startDragPos) select 1) - (GVAR(plottingBoard_startPos) select 1)) mod 360);
                    // Start rotating
                    GVAR(plottingBoard_isRotating) = _click;
                    
                } else {
                    // Start dragging
                    GVAR(plottingBoard_isDragging) = true;
                };
                
                _handled = true;
            };
        };
    };
};

_handled
