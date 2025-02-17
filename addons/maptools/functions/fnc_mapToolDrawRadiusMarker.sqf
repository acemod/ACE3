#include "..\script_component.hpp"
/*
 * Author: Seb
 * Creates a display that allows a maptool user to mark a radius of x around the 0 point of their maptool
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_maptools_fnc_mapToolDrawRadiusMarker
 *
 * Public: No
 */

if (GVAR(mapTool_Shown) isEqualTo 0) exitWith {};
[{
    private _display = findDisplay 12 createDisplay QGVAR(drawRadiusDisplay);
    private _textCtrl = _display displayCtrl 451;
    _textCtrl ctrlSetText "100";
    _display displayAddEventHandler ["Unload", {
        params ["_display", "_exitCode"];
        if (_exitCode isNotEqualTo 1) exitWith {};
        private _textCtrl = _display displayCtrl 451;
        private _radiusStr = ctrlText _textCtrl;
        private _radius = parseNumber _radiusStr;
        if (_radius isEqualTo 0) exitWith {
            [LLSTRING(InvalidRadius)] call EFUNC(common,displayTextStructured);
        };
        private _textureWidth = [TEXTURE_WIDTH_IN_M, TEXTURE_WIDTH_IN_M / 2] select (GVAR(mapTool_Shown) - 1);
        private _bottomOffset = [40, 20] select (GVAR(mapTool_Shown) - 1); // Distance from bottom of texture to "0" notch on maptool
        private _zeroposition = (GVAR(mapTool_pos) vectorAdd [
            // Offset Y
            (_textureWidth / 4) * sin (GVAR(mapTool_angle) + 90) * (1 + CENTER_OFFSET_Y_PERC),
            (_textureWidth / 4) * cos (GVAR(mapTool_angle) + 90) * (1 + CENTER_OFFSET_Y_PERC),
            0
        ]) vectorAdd [
            // Offset X
            (_textureWidth * DIST_BOTTOM_TO_CENTER_PERC + _bottomOffset) * sin GVAR(mapTool_angle),
            (_textureWidth * DIST_BOTTOM_TO_CENTER_PERC + _bottomOffset) * cos GVAR(mapTool_angle),
            0
        ]; 
        private _polyline = [];
        for "_angle" from 0 to 360 step 10 do {
            private _posWorld = ([sin _angle, cos _angle] vectorMultiply _radius) vectorAdd _zeroPosition;
            _polyline append (_posWorld select [0,2]);
        };
        private _markerColor = "ColorBlack";
        if !(isNil QEGVAR(markers,currentMarkerColorConfigName)) then {
            if (EGVAR(markers,currentMarkerColorConfigName) isEqualTo "") exitWith {};
            _markerColor = EGVAR(markers,currentMarkerColorConfigName)
        };
        private _markerName = "_USER_DEFINED " + QGVAR(radiusMarker) + (hashValue diag_tickTime);
        private _marker = createMarkerLocal [_markerName, _zeroPosition, currentChannel, call CBA_fnc_currentUnit];
        _marker setMarkerColorLocal _markerColor;
        _marker setMarkerShapeLocal "POLYLINE";
        _marker setMarkerPolyline _polyline;
    }];
}] call CBA_fnc_execNextFrame;
