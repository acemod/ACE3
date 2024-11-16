#include "..\script_component.hpp"
/*
 * Author: esteldunedain, LorenLuke
 * Handle mouse buttons.
 *
 * Arguments:
 * 0: 1 if mouse down down, 0 if mouse button up <NUMBER>
 * 1: Parameters of the mouse button event <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, []] call ace_maptools_fnc_handleMouseButton
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
            if (GVAR(freeDrawingData) isEqualTo []) exitWith {TRACE_1("never touched roamer",GVAR(freeDrawingData))};

            private _allMarkers = allMapMarkers;

            if (_allMarkers isEqualTo []) exitWith {};

            private _markerName = _allMarkers select -1;
            private _markerPos = getMarkerPos _markerName;
            private _distanceCheck = _markerPos distance2D GVAR(drawPosStart);

            TRACE_3("Line Drawn",_markerName,_markerPos,_distanceCheck);

            if (_distanceCheck > 1) exitWith {WARNING("Wrong Marker!")};

            GVAR(freeDrawingData) params ["", "_startStraightPos", "_endStraightPos"];

            _markerName setMarkerPolyline [
                _startStraightPos#0, _startStraightPos#1,
                _endStraightPos#0, _endStraightPos#1
            ];
        }, []] call CBA_fnc_execNextFrame;
    } else {
        if (_ctrlKey && {_dir == 1}) then {
            GVAR(freeDrawingData) = [];
            GVAR(freedrawing) = true;
            GVAR(drawPosStart) = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
            TRACE_2("Starting Line",GVAR(freedrawing),GVAR(drawPosStart));
        } else {
            GVAR(freedrawing) = false;
            TRACE_1("weird - resetting",GVAR(freedrawing));
        };
    };

    false // return
};

// If it's not a left button event, exit
if (_button != 0) exitWith {
    false // return
};

// If releasing
if (_dir != 1) then {
    if (GVAR(mapTool_isDragging) || GVAR(mapTool_isRotating)) then {
        GVAR(mapTool_isDragging) = false;
        GVAR(mapTool_isRotating) = false;
    };

    if (GVAR(plottingBoard_isDragging) || GVAR(plottingBoard_isRotating) > -1) then {
        GVAR(plottingBoard_isDragging) = false;
        GVAR(plottingBoard_isRotating) = -1;
    };
} else {
    // If clicking
    if (call FUNC(canUseMapTools)) then {
        GVAR(mapTool_isDragging) = false;
        GVAR(mapTool_isRotating) = false;

        // If no map tool marker then exit
        if (GVAR(mapTool_Shown) != 0) then {
            // Transform mouse screen position to coordinates
            private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];

            // Check if clicking the maptool
            if (_pos call FUNC(isInsideMapTool)) then {
                // Store data for dragging
                GVAR(mapTool_startPos) = +GVAR(mapTool_pos);
                GVAR(mapTool_startDragPos) = _pos;

                private _rotateKeyPressed = switch (GVAR(rotateModifierKey)) do {
                    case 1: {_altKey};
                    case 2: {_ctrlKey};
                    case 3: {_shiftKey};
                    default {false};
                };

                if (_rotateKeyPressed) then {
                    // Store data for rotating
                    GVAR(mapTool_startAngle) = GVAR(mapTool_angle);

                    private _pos = GVAR(mapTool_startDragPos) vectorDiff GVAR(mapTool_startPos);
                    GVAR(mapTool_startDragAngle) = ((_pos select 0) atan2 (_pos select 1) + 360) % 360;

                    // Start rotating
                    GVAR(mapTool_isRotating) = true;
                } else {
                    // Start dragging
                    GVAR(mapTool_isDragging) = true;
                };
            };
        };
    };

    if (call FUNC(canUsePlottingBoard)) then {
        GVAR(plottingBoard_isDragging) = false;
        GVAR(plottingBoard_isRotating) = -1;

        if (GVAR(plottingBoard_Shown) != 0) then {
            // Transform mouse screen position to coordinates
            private _pos = _control ctrlMapScreenToWorld [_screenPosX, _screenPosY];
            private _click = _pos call FUNC(isInsidePlottingBoard);

            if (_click > -1) then {
                GVAR(plottingBoard_startPos) = +GVAR(plottingBoard_pos);
                GVAR(plottingBoard_startDragPos) = _pos;

                private _rotateKeyPressed = switch (GVAR(rotateModifierKey)) do {
                    case 1: {_altKey};
                    case 2: {_ctrlKey};
                    case 3: {_shiftKey};
                    default {false};
                };

                if (_rotateKeyPressed) then {
                    // Store data for rotating
                    private _ang = switch (_click) do {
                        case 1: {GVAR(plottingBoard_acrylicAngle)};
                        case 2: {GVAR(plottingBoard_rulerAngle)};
                        default {GVAR(plottingBoard_angle)};
                    };

                    GVAR(plottingBoard_startAngle) = _ang;

                    private _pos = GVAR(plottingBoard_startDragPos) vectorDiff GVAR(plottingBoard_startPos);
                    GVAR(plottingBoard_startDragAngle) = ((_pos select 0) atan2 (_pos select 1) + 360) % 360;

                    // Start rotating
                    GVAR(plottingBoard_isRotating) = _click;
                } else {
                    // Start dragging
                    GVAR(plottingBoard_isDragging) = true;
                };
            };
        };
    };
};
