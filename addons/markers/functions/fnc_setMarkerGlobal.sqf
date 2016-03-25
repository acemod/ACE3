/*
 * Author: commy2
 * Sets newly placed marker on each client
 *
 * Arguments:
 * 0: Markername <STRING>
 * 1: Marker Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["marker",["markerclass", "colorRed", [0,0,0], 60, ""]] call ace_markers_fnc_setMarkerGlobal;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_marker", "_data"];
TRACE_2("params",_marker,_data);

[_marker, _data] call FUNC(setMarkerLocal);

if (GVAR(enableUniqueMaps) && {time == 0} && {_marker in allMapMarkers}) then {
    GVAR(briefingMarkers) pushBack [_marker, _data];
};

// save properties on server machine for JIP, marker editing ready
if (isMultiplayer && {isServer}) then {
    private _allMapMarkers = GVAR(mapNamespace) getVariable QGVAR(allMapMarkers);
    if (isNil "_allMapMarkers") then {_allMapMarkers = [];};
    private _allMapMarkersProperties = GVAR(mapNamespace) getVariable QGVAR(allMapMarkersProperties);
    if (isNil "_allMapMarkersProperties") then {_allMapMarkersProperties = [];};

    private _index = _allMapMarkers find _marker;

    if (_index == -1) then {
        _allMapMarkers pushBack _marker;
        _allMapMarkersProperties pushBack _data;
    } else {
        _allMapMarkers set [_index, _marker];
        _allMapMarkersProperties set [_index, _data];
    };

    GVAR(mapNamespace) setVariable [QGVAR(allMapMarkers), _allMapMarkers];
    GVAR(mapNamespace) setVariable [QGVAR(allMapMarkersProperties), _allMapMarkersProperties];
};
