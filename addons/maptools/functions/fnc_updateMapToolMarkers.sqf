#include "..\script_component.hpp"
/*
 * Author: esteldunedain, LorenLuke
 * Update the map tool and plotting board markers. Update their position, size, rotation and visibility.
 *
 * Arguments:
 * 0: Map control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_maptools_fnc_updateMapToolMarkers
 *
 * Public: No
 */

params ["_mapCtrl"];

if (GVAR(plottingBoard_Shown) == 0) then {
    // Hide all plotting board markers when board is put away
    {
        if (_y select 4 != 0) then {
            _x setMarkerAlpha 0;
            _y set [4, 0];
        };
    } forEach GVAR(plottingBoard_markers);
} else {
    if !([ACE_player, "ACE_PlottingBoard"] call EFUNC(common,hasItem)) exitWith {};

    if (GVAR(plottingBoard_moveToMouse)) then {
        GVAR(plottingBoard_pos) = _mapCtrl ctrlMapScreenToWorld getMousePosition;
        GVAR(plottingBoard_moveToMouse) = false;  // we only need to do this once after opening the map tool
    };

    getResolution params ["_resWidth", "_resHeight", "", "", "_aspectRatio"];
    private _scaleX = 32 * PLOTTINGBOARD_TEXTUREWIDTH * CONSTANT_SCALE * (call FUNC(calculateMapScale));
    private _scaleY = _scaleX * ((_resWidth / _resHeight) / _aspectRatio); // handle bad aspect ratios

    _mapCtrl drawIcon [QPATHTOF(data\plottingBoardBack.paa), [1, 1, 1, 1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_angle), "", 0];
    _mapCtrl drawIcon [QPATHTOF(data\plottingBoardAcrylic.paa), [1, 1, 1, 1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_acrylicAngle), "", 0];

    // Show ruler
    if (GVAR(plottingBoard_Shown) == 2) then {
        _mapCtrl drawIcon [QPATHTOF(data\plottingBoardRuler.paa), [1, 1, 1, 1], GVAR(plottingBoard_pos), _scaleX, _scaleY, GVAR(plottingBoard_rulerAngle), "", 0];
    };

    private _marker = "";
    private _angle = GVAR(plottingBoard_acrylicAngle);
    private _boardPos = GVAR(plottingBoard_pos);
    private _count = -1;
    private _rotatedPolyPos = [];
    private _rotatedPos = [];

    {
        _marker = _x;
        _y params ["_markerPos", "_polyline", "_lastAngle", "_lastBoardPos", "_lastAlpha"];

        // Show all plotting board markers when the board is shown
        if (_lastAlpha != 1) then {
            _marker setMarkerAlpha 1;
            _y set [4, 1];
        };

        // If nothing has changed, don't update marker
        if (_angle == _lastAngle && {_boardPos isEqualTo _lastBoardPos}) then {
            continue;
        };

        _count = count _polyline;

        // Rotate all points of polyline
        if (_count >= 4) then { // polylines need at least 2 points (2 components per point)
            private _rotatedPolyline = [];

            for "_i" from 0 to _count - 1 step 2 do {
                _rotatedPolyPos = [[0, 0], [_polyline select _i, _polyline select (_i + 1)], -_angle] call CBA_fnc_vectRotate2D;
                _rotatedPolyline append (_rotatedPolyPos vectorAdd _boardPos);
            };

            _marker setMarkerPolyline _rotatedPolyline;
        };

        // Rotate marker position, regardless of marker type
        _rotatedPos = [[0, 0], _markerPos, -_angle] call CBA_fnc_vectRotate2D;

        _marker setMarkerPos (_boardPos vectorAdd _rotatedPos);

        _y set [2, _angle];
        _y set [3, +_boardPos];
    } forEach GVAR(plottingBoard_markers);
};

if ((GVAR(mapTool_Shown) != 0) && {[ACE_player, "ACE_MapTools"] call EFUNC(common,hasItem)}) then {
    // Open map tools in center of screen when toggled to be shown
    if (GVAR(mapTool_moveToMouse)) then {
        GVAR(mapTool_pos) = _mapCtrl ctrlMapScreenToWorld getMousePosition;
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

    if (GVAR(freedrawing)) then {
        [_mapCtrl, _textureWidth] call FUNC(drawLinesOnRoamer);
    };

    // Update scale of both parts
    getResolution params ["_resWidth", "_resHeight", "", "", "_aspectRatio"];
    private _scaleX = 32 * _textureWidth * CONSTANT_SCALE * (call FUNC(calculateMapScale));
    private _scaleY = _scaleX * ((_resWidth / _resHeight) / _aspectRatio); // handle bad aspect ratios

    // Position of the fixed part
    private _pos = GVAR(mapTool_pos) vectorAdd [0, _textureWidth * CENTER_OFFSET_Y_PERC];

    _mapCtrl drawIcon [QPATHTOF(data\mapToolFixed.paa), [1, 1, 1, 1], _pos, _scaleX, _scaleY, 0, "", 0];

    // Position and rotation of the rotating part
    _pos = GVAR(mapTool_pos) vectorAdd ([sin GVAR(mapTool_angle), cos GVAR(mapTool_angle)] vectorMultiply (_textureWidth * CENTER_OFFSET_Y_PERC));

    _mapCtrl drawIcon [_rotatingTexture, [1, 1, 1, 1], _pos, _scaleX, _scaleY, GVAR(mapTool_angle), "", 0];
};
