#include "..\script_component.hpp"
/*
 * Author: LorenLuke, johnb43
 * Handle map marker creation.
 * If a marker is (partially) on the plotting board, the parts on the plotting board are attached to the plotting board
 * and move with the board accordingly.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Marker name <STRING>
 * - 1: Chat channel number <NUMBER>
 * - 2: Marker owner <OBJECT>
 * - 3: Local origin <BOOL>
 * 1: Deleted <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, [0, 5]] call ace_maptools_fnc_handlePlottingBoardMarkers
 *
 * Public: No
 */

params ["_args", "_deleted"];
_args params ["_marker", "_channelNumber", "_owner", "_local"];

if (_deleted) exitWith {
    GVAR(plottingBoard_markers) deleteAt _marker;
};

// Do not process non-local or already processed markers, don't check if the plotting board isn't shown
if (!_local || {GVAR(plottingBoard_Shown) == 0} || {QUOTE(ADDON) in _marker}) exitWith {};

// Check if the channel the marker was made in can be marked on the plotting board
private _continue = true;

if (isMultiplayer) then {
    switch (GVAR(plottingBoardAllowChannelDrawing)) do {
        case 0: {
            if (_channelNumber != 5) then {_continue = false};
        };
        case 1: {
            if !(_channelNumber in [3, 5]) then {_continue = false};
        };
    };
};

if (!_continue) exitWith {};

private _boardPos = GVAR(plottingBoard_pos);
private _boardAng = GVAR(plottingBoard_acrylicAngle);

private _markerPolyline = markerPolyline _marker;
private _count = count _markerPolyline;

// If the marker is not a polyline marker
if (_count == 0) exitWith {
    private _diffPos = (getMarkerPos _marker) vectorDiff _boardPos;

    // If the marker is on the acrylic or ruler of the plotting board, save it
    if (vectorMagnitude _diffPos < PLOTTINGBOARD_DRAWRANGE) then {
        private _relPos = [[0, 0], _diffPos, _boardAng] call CBA_fnc_vectRotate2D;

        GVAR(plottingBoard_markers) set [_marker, [_relPos, [], _boardAng, +_boardPos, 1]];
    };
};

// If the marker is a polyline marker, but doesn't have enough components (happens when you ctrl-left click on the map), ignore
if (_count <= 4) exitWith {};

// Polyine markers (lines)
private _startPos = [];
private _endPos = [];
private _dir = [];
private _diffPos = [];

private _a = 0;
private _b = 0;
private _c = 0;
private _t1 = nil;
private _t2 = nil;
private _delta = 0;

private _intersectionValid1 = false;
private _intersectionValid2 = false;
private _intersectPoint1 = [];
private _intersectPoint2 = [];
private _intersectClose = [];
private _intersectFar = [];

private _polylineIndex = 0;
private _markerArray = [[]];
private _insideArray = [];

for "_i" from 0 to _count - 1 - 2 step 2 do {
    _startPos = [_markerPolyline select _i, _markerPolyline select (_i + 1)];
    _endPos = [_markerPolyline select (_i + 2), _markerPolyline select (_i + 3)];
    _dir = _endPos vectorDiff _startPos;
    _diffPos = _startPos vectorDiff _boardPos;

    // Circle-line intersection: Check for intersections between plotting board and current piece of polyline
    // https://stackoverflow.com/a/1084899
    _a = _dir vectorDotProduct _dir;
    _b = 2 * (_diffPos vectorDotProduct _dir);
    _c = (_diffPos vectorDotProduct _diffPos) - PLOTTINGBOARD_DRAWRANGE^2;

    _delta = _b^2 - 4 * _a * _c;

    // Stretch factors
    _t1 = nil;
    _t2 = nil;

    if (_delta > 0) then {
        _t1 = (-_b + sqrt _delta) / (2 * _a);
        _t2 = (-_b - sqrt _delta) / (2 * _a);

        // Don't look for intersection points beyond the start or end points
        if (_t1 < 0 || _t1 > 1) then {
            _t1 = nil;
        };

        if (_t2 < 0 || _t2 > 1) then {
            _t2 = nil;
        };
    };

    // The current point is always part of a polyline
    (_markerArray param [_polylineIndex, []]) append _startPos;
    _insideArray set [_polylineIndex, vectorMagnitude _diffPos < PLOTTINGBOARD_DRAWRANGE]; // keep track if point is within plotting board

    _intersectionValid1 = !isNil "_t1";
    _intersectionValid2 = !isNil "_t2";

    // If no valid intersection points, continue
    if (!_intersectionValid1 && {!_intersectionValid2}) then {
        continue;
    };

    // Extremely rare case if the marker is tangential to the plotting board: Ignore
    if (_intersectionValid1 && {_intersectionValid2} && {_t1 == _t2}) then {
        continue;
    };

    if (_intersectionValid1) then {
        _intersectPoint1 = _startPos vectorAdd (_dir vectorMultiply _t1);
    };

    if (_intersectionValid2) then {
        _intersectPoint2 = _startPos vectorAdd (_dir vectorMultiply _t2);
    };

    // When a marker crosses the plotting board entirely (one straight line through the plotting board)
    if (_intersectionValid1 && {_intersectionValid2}) then {
        // Take the closer point first
        _intersectClose = [_intersectPoint1, _intersectPoint2] select (_t1 > _t2);

        // Finish previous polyline with the last point being the intersection
        (_markerArray select _polylineIndex) append _intersectClose;

        // Create a new polyline, with the first point being the closest intersection
        _polylineIndex = _polylineIndex + 1;
        _markerArray set [_polylineIndex, _intersectClose];

        // Now take the point further away
        _intersectFar = [_intersectPoint1, _intersectPoint2] select (_t1 < _t2);

        // Make a polyline between the intersection points
        (_markerArray select _polylineIndex) append _intersectClose;
        (_markerArray select _polylineIndex) append _intersectFar;
        _insideArray set [_polylineIndex, true]; // with 2 intersections, this part of the polyline must be inside

        // Create a new polyline, with the first point being the furthest intersection
        _polylineIndex = _polylineIndex + 1;
        _markerArray set [_polylineIndex, _intersectFar];
    } else {
        // Only 1 intersection (either point 1 or 2, exclusive or)
        if (_intersectionValid2) then {
            _intersectPoint1 = _intersectPoint2;
        };

        // Finish previous polyline with the last point being the intersection
        (_markerArray select _polylineIndex) append _intersectPoint1;

        // Create a new polyline, with the first point being the intersection
        _polylineIndex = _polylineIndex + 1;
        _markerArray set [_polylineIndex, _intersectPoint1];
    };
};

// If there were no polyline intersections and the marker was not on the plotting board, don't create new markers
if (_insideArray isEqualTo [false]) exitWith {};

private _color = getMarkerColor _marker;
private _name = "";
private _polylineRelative = [];
private _relPos = [];

{
    _name = format ["%1-%2-%3", _marker, _forEachIndex, QUOTE(ADDON)]; // adding an identifier allow to check if marker was already processed
    createMarkerLocal [_name, [0, 0], _channelNumber, _owner];
    _name setMarkerColorLocal _color;
    _name setMarkerPolyline _x; // global marker broadcast

    // If the marker was on the plotting board, take it's unrotated position and store it
    if (_insideArray select _forEachIndex) then {
        _polylineRelative = [];

        for "_i" from 0 to count _x - 1 step 2 do {
            _relPos = [[0, 0], [_x select _i, _x select (_i + 1)] vectorDiff _boardPos, _boardAng] call CBA_fnc_vectRotate2D;
            _polylineRelative append _relPos;
        };

        GVAR(plottingBoard_markers) set [_name, [[0, 0], +_polylineRelative, _boardAng, +_boardPos, 1]];
    };
} forEach _markerArray;

// Delete original marker
deleteMarker _marker;
