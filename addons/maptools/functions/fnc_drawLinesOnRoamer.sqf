/*
 * Author: PabstMirror
 * Prevents the cursor from entering the roamer when drawing lines and records the positions
 *
 * Arguments:
 * 0: The Map <CONTROL>
 * 1: Roamer Width <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [map, 300] call ace_maptools_fnc_drawLinesOnRoamer
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(drawStraightLines)) exitWith {};

params ["_theMap", "_roamerWidth"];
GVAR(mapTool_pos) params ["_roamerPosX", "_roamerPosY"];

private _posCenter = [_roamerPosX, _roamerPosY, 0];

private _posTopRight = [
_roamerPosX + (cos GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (sin GVAR(mapTool_angle)) * DIST_TOP_TO_CENTER_PERC * _roamerWidth,
_roamerPosY + (-sin GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (cos GVAR(mapTool_angle)) * DIST_TOP_TO_CENTER_PERC * _roamerWidth,
0];

private _posTopLeft = [
_roamerPosX + (-cos GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (sin GVAR(mapTool_angle)) * DIST_TOP_TO_CENTER_PERC * _roamerWidth,
_roamerPosY + (sin GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (cos GVAR(mapTool_angle)) * DIST_TOP_TO_CENTER_PERC * _roamerWidth,
0];

private _posBottomLeft = [
_roamerPosX + (-cos GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (sin GVAR(mapTool_angle)) * DIST_BOTTOM_TO_CENTER_PERC * _roamerWidth,
_roamerPosY + (sin GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (cos GVAR(mapTool_angle)) * DIST_BOTTOM_TO_CENTER_PERC * _roamerWidth,
0];

private _posBottomRight = [
_roamerPosX + (cos GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (sin GVAR(mapTool_angle)) * DIST_BOTTOM_TO_CENTER_PERC * _roamerWidth,
_roamerPosY + (-sin GVAR(mapTool_angle)) * DIST_LEFT_TO_CENTER_PERC * _roamerWidth + (cos GVAR(mapTool_angle)) * DIST_BOTTOM_TO_CENTER_PERC * _roamerWidth,
0];

private _fnc_Distance = { // Get distance point _p is from a line made from _a to _b (uses 3d array commands, but z should be 0)
    // Ref: https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line#Vector_formulation
    params ["_a", "_b", "_p"];
    private _n = _b vectorDiff _a;
    private _pa = _a vectorDiff _p;
    private _c = _n vectorMultiply ((_pa vectorDotProduct _n) / (_n vectorDotProduct _n));
    private _d = _pa vectorDiff _c;
    sqrt (_d vectorDotProduct _d);
};

private _currentMousePos = _theMap ctrlMapScreenToWorld getMousePosition;
_currentMousePos set [2, 0];

// Break the roamer rectangle into 4 triangle, one for each side
switch (true) do {
    case (_currentMousePos inPolygon [_posCenter, _posTopLeft, _posBottomLeft]): { // Left
        private _distanceToRoamerLine = ([_posTopLeft, _posBottomLeft, _currentMousePos] call _fnc_Distance);
        _currentMousePos = _currentMousePos vectorAdd ([_distanceToRoamerLine, (GVAR(mapTool_angle) - 90) ,0] call CBA_fnc_polar2vect);
        if (GVAR(freeDrawingData) isEqualTo []) then { // We start drawing on the line
            GVAR(freeDrawingData) = ["left", _currentMousePos, _currentMousePos];
        } else {
            if ((GVAR(freeDrawingData) select 0) == "left") then { // We are already drawing on this line, find best spot
                if ((_currentMousePos distance2d _posTopLeft) < ((GVAR(freeDrawingData) select 1) distance2d _posTopLeft)) then {
                    GVAR(freeDrawingData) set [1, _currentMousePos];
                };
                if ((_currentMousePos distance2d _posBottomLeft) < ((GVAR(freeDrawingData) select 2) distance2d _posBottomLeft)) then {
                    GVAR(freeDrawingData) set [2, _currentMousePos];
                };
            };
        };
        private _screenPosOfCorrectedPos = _theMap ctrlMapWorldToScreen _currentMousePos;
        setMousePosition _screenPosOfCorrectedPos;
    };
    case (_currentMousePos inPolygon [_posCenter, _posTopLeft, _posTopRight]): { // Top
        private _distanceToRoamerLine = ([_posTopLeft, _posTopRight, _currentMousePos] call _fnc_Distance);
        _currentMousePos = _currentMousePos vectorAdd ([_distanceToRoamerLine, (GVAR(mapTool_angle) + 0) ,0] call CBA_fnc_polar2vect);
        if (GVAR(freeDrawingData) isEqualTo []) then { // We start drawing on the line
            GVAR(freeDrawingData) = ["top", _currentMousePos, _currentMousePos];
        } else {
            if ((GVAR(freeDrawingData) select 0) == "top") then { // We are already drawing on this line, find best spot
                if ((_currentMousePos distance2d _posTopLeft) < ((GVAR(freeDrawingData) select 1) distance2d _posTopLeft)) then {
                    GVAR(freeDrawingData) set [1, _currentMousePos];
                };
                if ((_currentMousePos distance2d _posTopRight) < ((GVAR(freeDrawingData) select 2) distance2d _posTopRight)) then {
                    GVAR(freeDrawingData) set [2, _currentMousePos];
                };
            };
        };
        private _screenPosOfCorrectedPos = _theMap ctrlMapWorldToScreen _currentMousePos;
        setMousePosition _screenPosOfCorrectedPos;
    };
    case (_currentMousePos inPolygon [_posCenter, _posTopRight, _posBottomRight]): { // Right
        private _distanceToRoamerLine = ([_posTopRight, _posBottomRight, _currentMousePos] call _fnc_Distance);
        _currentMousePos = _currentMousePos vectorAdd ([_distanceToRoamerLine, (GVAR(mapTool_angle) + 90) ,0] call CBA_fnc_polar2vect);
        if (GVAR(freeDrawingData) isEqualTo []) then { // We start drawing on the line
            GVAR(freeDrawingData) = ["right", _currentMousePos, _currentMousePos];
        } else {
            if ((GVAR(freeDrawingData) select 0) == "right") then { // We are already drawing on this line, find best spot
                if ((_currentMousePos distance2d _posTopRight) < ((GVAR(freeDrawingData) select 1) distance2d _posTopRight)) then {
                    GVAR(freeDrawingData) set [1, _currentMousePos];
                };
                if ((_currentMousePos distance2d _posBottomRight) < ((GVAR(freeDrawingData) select 2) distance2d _posBottomRight)) then {
                    GVAR(freeDrawingData) set [2, _currentMousePos];
                };
            };
        };
        private _screenPosOfCorrectedPos = _theMap ctrlMapWorldToScreen _currentMousePos;
        setMousePosition _screenPosOfCorrectedPos;
    };
    case (_currentMousePos inPolygon [_posCenter, _posBottomLeft, _posBottomRight]): { // Bottom
        private _distanceToRoamerLine = ([_posBottomLeft, _posBottomRight, _currentMousePos] call _fnc_Distance);
        _currentMousePos = _currentMousePos vectorAdd ([_distanceToRoamerLine, (GVAR(mapTool_angle) + 180) ,0] call CBA_fnc_polar2vect);
        if (GVAR(freeDrawingData) isEqualTo []) then { // We start drawing on the line
            GVAR(freeDrawingData) = ["bottom", _currentMousePos, _currentMousePos];
        } else {
            if ((GVAR(freeDrawingData) select 0) == "bottom") then { // We are already drawing on this line, find best spot
                if ((_currentMousePos distance2d _posBottomLeft) < ((GVAR(freeDrawingData) select 1) distance2d _posBottomLeft)) then {
                    GVAR(freeDrawingData) set [1, _currentMousePos];
                };
                if ((_currentMousePos distance2d _posBottomRight) < ((GVAR(freeDrawingData) select 2) distance2d _posBottomRight)) then {
                    GVAR(freeDrawingData) set [2, _currentMousePos];
                };
            };
        };
        private _screenPosOfCorrectedPos = _theMap ctrlMapWorldToScreen _currentMousePos;
        setMousePosition _screenPosOfCorrectedPos;
    };
};

#ifdef DEBUG_MODE_FULL
_theMap drawIcon ['iconStaticMG',[1,0,0,1],_posTopRight,24,24,getDir player,'1,1',1,0.03,'TahomaB','right'];
_theMap drawIcon ['iconStaticMG',[1,0,0,1],_posTopLeft,24,24,getDir player,'-1,1',1,0.03,'TahomaB','right'];
_theMap drawIcon ['iconStaticMG',[1,0,0,1],_posBottomLeft,24,24,getDir player,'-1,-1',1,0.03,'TahomaB','right'];
_theMap drawIcon ['iconStaticMG',[1,0,0,1],_posBottomRight,24,24,getDir player,'1,-1',1,0.03,'TahomaB','right'];
if !(GVAR(freeDrawingData) isEqualTo []) then {
    _theMap drawIcon ['iconStaticMG',[0,0,1,1],GVAR(freeDrawingData) select 1,24,24,getDir player,'1,-1',1,0.03,'TahomaB','right'];
    _theMap drawIcon ['iconStaticMG',[0,0,1,1],GVAR(freeDrawingData) select 2,24,24,getDir player,'1,-1',1,0.03,'TahomaB','right'];
};
#endif
