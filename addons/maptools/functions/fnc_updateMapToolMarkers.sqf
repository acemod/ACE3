#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Update the map tool markers, position, size, rotation and visibility.
 *
 * Arguments:
 * 0: The Map <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ACE_maptools_fnc_updateMapToolMarkers
 *
 * Public: No
 */

params ["_theMap"];

if (GVAR(plottingBoard_Shown == 0)) then {
    {
        private _marker = _x; 
        _marker setMarkerAlpha 0;
    } forEach GVAR(plottingBoard_markers);
};


if ( ((GVAR(mapTool_Shown) == 0) && {GVAR(plottingBoard_Shown == 0)}) || {!(("ACE_MapTools" in (ACE_player call EFUNC(common,uniqueItems))) || {"ACE_PlottingBoard" in (ACE_player call EFUNC(common,uniqueItems))})}) exitWith {};


if (GVAR(plottingBoard_Shown) > 0) then {

    if (GVAR(plottingBoard_moveToMouse)) then {
        private _mousePosition = _theMap ctrlMapScreenToWorld getMousePosition;
        GVAR(plottingBoard_pos) = _mousePosition;
        GVAR(plottingBoard_moveToMouse) = false;  // we only need to do this once	after opening the map tool
    };

    private _textureWidth = PLOTTINGBOARD_TEXTUREWIDTH;
    getResolution params ["_resWidth", "_resHeight", "", "", "_aspectRatio"];
    private _scaleX = 32 * _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));
    private _scaleY = _scaleX * ((_resWidth / _resHeight) / _aspectRatio); //handle bad aspect ratios

    _theMap drawIcon [QPATHTOF(data\plottingBoardBack.paa), [1,1,1,1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_angle), "", 0];
    _theMap drawIcon [QPATHTOF(data\plottingBoardAcrylic.paa), [1,1,1,1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_acrylicAngle), "", 0];
 
 
    if (GVAR(plottingBoard_Shown) == 2) then {
        _theMap drawIcon [QPATHTOF(data\plottingBoardRuler.paa), [1,1,1,1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_rulerAngle), "", 0];
    };

    
    {
        private _marker = _x; 
        _y params ["_markerPos", "_polyline", "_lastAngle", "_lastBoardPos"];
        _marker setMarkerAlpha 1;
        private _angle = GVAR(plottingBoard_acrylicAngle);
        private _boardPos = GVAR(plottingBoard_pos);
        if (_angle == _lastAngle && {_boardPos isEqualTo _lastBoardPos}) then {continue};

        private _rotatedPos = [[0,0,0], _markerPos, -_angle] call CBA_fnc_vectRotate2D;
        private _rotatedPolyline = [];
        
        if (count _polyline  > 0) then {
        
            for "_i" from 0 to ((count _polyline) - 1) step 2 do {
                private _rotatedPolyPos = [[0,0], [_polyline select _i, _polyline select (_i + 1)], -_angle] call CBA_fnc_vectRotate2D;
                _rotatedPolyPos = _rotatedPolyPos vectorAdd _boardPos;
                _rotatedPolyline pushBack (_rotatedPolyPos select 0);
                _rotatedPolyline pushBack (_rotatedPolyPos select 1);
            };
            _marker setMarkerPolyline _rotatedPolyline;
        };

        _marker setMarkerPos (_boardPos vectorAdd _rotatedPos);
        _y set [2, _angle];
        _y set [3, +_boardPos];
        
    } forEach GVAR(plottingBoard_markers);
};


if (GVAR(mapTool_Shown) > 0) then {
    // open map tools in center of screen when toggled to be shown
    if (GVAR(mapTool_moveToMouse)) then {
        private _mousePosition = _theMap ctrlMapScreenToWorld getMousePosition;
        GVAR(mapTool_pos) = _mousePosition;
        GVAR(mapTool_moveToMouse) = false;  // we only need to do this once	after opening the map tool
    };

    private _rotatingTexture = "";
    private _textureWidth = 0;
    if (GVAR(mapTool_Shown) == 1) then {
        _rotatingTexture = QPATHTOF(data\mapToolRotatingNormal.paa);
        _textureWidth = TEXTURE_WIDTH_IN_M;
    } else {
        _rotatingTexture = QPATHTOF(data\mapToolRotatingSmall.paa);
        _textureWidth = TEXTURE_WIDTH_IN_M / 2;
    };

    if (GVAR(freedrawing)) then {[_theMap, _textureWidth] call FUNC(drawLinesOnRoamer);};

    // Update scale of both parts
    getResolution params ["_resWidth", "_resHeight", "", "", "_aspectRatio"];
    private _scaleX = 32 * _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));
    private _scaleY = _scaleX * ((_resWidth / _resHeight) / _aspectRatio); //handle bad aspect ratios

    // Position of the fixed part
    private _xPos = GVAR(mapTool_pos) select 0;
    private _yPos = (GVAR(mapTool_pos) select 1) + _textureWidth * CENTER_OFFSET_Y_PERC;

    _theMap drawIcon [QPATHTOF(data\mapToolFixed.paa), [1,1,1,1], [_xPos,_yPos], _scaleX, _scaleY, 0, "", 0];

    // Position and rotation of the rotating part
    _xPos = (GVAR(mapTool_pos) select 0) + sin(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;
    _yPos = (GVAR(mapTool_pos) select 1) + cos(GVAR(mapTool_angle)) * _textureWidth * CENTER_OFFSET_Y_PERC;

    _theMap drawIcon [_rotatingTexture, [1,1,1,1], [_xPos,_yPos], _scaleX, _scaleY, GVAR(mapTool_angle), "", 0];
};

