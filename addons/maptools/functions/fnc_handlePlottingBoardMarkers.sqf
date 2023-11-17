#include "..\script_component.hpp"
/*
 * Author: LorenLuke
 * Handle mouse movement over the map tool.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Marker Name <STRING>
 * - 1: Chat Channel Number <NUMBER>
 * - 2: Marker Owner <OBJECT>
 * - 3: Local Origin <BOOL>
 * 1: Deleted <BOOL>
 *
 * Return Value:
 * true if event was handled <BOOL>
 *
 * Example:
 * [CONTROL, [0, 5]] call ACE_maptools_fnc_handlePlottingBoardMarkers
 *
 * Public: No
 */

params ["_args", "_deleted"];
_args params ["_marker", "_channelNumber", "_owner", "_local"];

if (_deleted) exitWith {
    GVAR(plottingBoard_markers) deleteAt _marker;
};

if (GVAR(plottingBoard_Shown) < 1) exitWith {};
if (!_local) exitWith {};

private _continue = true;
if (isMultiplayer) then {
    switch (GVAR(plottingBoardAllowChannelDrawing)) do {
        case 0: {
            if (_channelNumber != 5) then {_continue = false};
        };
        case 1: {
            if !(_channelNumber in [3,5]) then {_continue = false};
        };
    };
};
if (!_continue) exitWith {};

private _boardPos = GVAR(plottingBoard_pos);
private _boardAng = GVAR(plottingBoard_acrylicAngle);

private _markerPolyline = markerPolyline _marker;
private _polylineOnMap = [];
private _polylineRelative = [];
private _polylineSubsegmentCount = 1;

if (count _markerPolyline > 0) exitWith {
    private _polyPos = [_markerPolyline select 0, _markerPolyline select 1];
    private _difPos = _polyPos vectorDiff _boardPos;
    private _dist = vectorMagnitude _difPos;
    private _inside = _dist < PLOTTINGBOARD_DRAWRANGE;

    for "_i" from 0 to (count _markerPolyline - 1) step 2 do {
        _polyPos = [_markerPolyline select _i, _markerPolyline select (_i + 1)];
        _difPos = _polyPos vectorDiff _boardPos;
        _dist = vectorMagnitude _difPos;
        private _relPos = [[0,0], _difPos, _boardAng] call CBA_fnc_vectRotate2D;

        if (_inside != (_dist < PLOTTINGBOARD_DRAWRANGE)) then {
            private _posPrev = [_markerPolyline select (_i - 2), _markerPolyline select (_i - 1)];
            private _lerpPos = vectorLinearConversion [
                _dist,
                _boardPos distance _posPrev,
                PLOTTINGBOARD_DRAWRANGE,
                [_polyPos select 0, _polyPos select 1, 0],
                [_posPrev select 0, _posPrev select 1, 0],
                true
            ];
            private _lerpPosDif = _lerpPos vectorDiff _boardPos;
            private _lerpPosRel = [[0,0], _lerpPosDif, _boardAng] call CBA_fnc_vectRotate2D;


            _polylineRelative pushback (_lerpPosRel select 0);
            _polylineRelative pushback (_lerpPosRel select 1);
            _polylineOnMap pushBack (_lerpPos select 0);
            _polylineOnMap pushBack (_lerpPos select 1);

            private _name = format ["%1-%2", _marker, _polylineSubsegmentCount];
            private _color = getMarkerColor _marker;
            private _mark = createMarker [_name, [0, 0], _channelNumber, _owner];
            _name setMarkerColor _color;

            if (_inside) then {
                GVAR(plottingBoard_markers) set [_name, [[0,0], +_polylineRelative, _boardAng, +_boardPos]];
            };
            [
                {(_this select 0) setMarkerPolyline (_this select 1)},
                [_name, _polylineOnMap]
            ] call CBA_fnc_execNextFrame;

            _inside = !_inside;
            _polylineSubsegmentCount = _polylineSubsegmentCount + 1;

            _polylineRelative = [_lerpPosRel select 0, _lerpPosRel select 1];
            _polylineOnMap = [_lerpPos select 0, _lerpPos select 1];
        };

        _polylineRelative pushBack (_relPos select 0);
        _polylineRelative pushBack (_relPos select 1);
        _polylineOnMap pushback (_polyPos select 0);
        _polylineOnMap pushback (_polyPos select 1);

    };

    private _name = format ["%1-%2", _marker, _polylineSubsegmentCount];
    private _color = getMarkerColor _marker;
    private _mark = createMarker [_name, [0, 0], _channelNumber, _owner];
    _name setMarkerColor _color;

    if (_inside) then {
        GVAR(plottingBoard_markers) set [_name, [[0,0], +_polylineRelative, _boardAng, +_boardPos]];
    };
    [
        {(_this select 0) setMarkerPolyline (_this select 1)},
        [_name, _polylineOnMap]
    ] call CBA_fnc_execNextFrame;

    deleteMarker _marker;
};

private _markerPos = getMarkerPos _marker;
private _difPos = _markerPos vectorDiff _boardPos;
private _dist = vectorMagnitude _difPos;

private _relPos = [[0,0], _difPos, _boardAng] call CBA_fnc_vectRotate2D;


if (_dist < PLOTTINGBOARD_DRAWRANGE) then {
    GVAR(plottingBoard_markers) set [_marker, [_relPos, []]];
};
