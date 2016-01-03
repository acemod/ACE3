/*
 * Author: commy2
 * Sets newly placed marker
 * Handles the QGVAR(setMarkerNetwork) event.
 *
 * Arguments:
 * 0: Markername <STRING>
 * 1: Marker Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[],[],dummyLogic] call ace_markers_fnc_setMarkerJIP;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_config"];

params ["_marker", "_data"];
_data params ["_markerClassname", "_colorClassname", "_markerPos", "_markerDir"];
TRACE_2("params",_marker,_data);


_config = (configFile >> "CfgMarkers") >> _markerClassname;
if (!isClass _config) then {
    WARNING("CfgMarker not found, changed to milDot");
    _config == (configFile >> "CfgMarkers" >> "MilDot");
};
_marker setMarkerTypeLocal (configName _config);

_config = (configFile >> "CfgMarkerColors") >> _colorClassname;
if (!isClass _config) then {
    WARNING("CfgMarkerColors not found, changed to Default");
    _config == (configFile >> "CfgMarkerColors" >> "Default");
};
_marker setMarkerColorLocal configName _config;

_marker setMarkerPosLocal _markerPos;
_marker setMarkerDirLocal _markerDir;

// save properties on server machine for JIP, marker editing ready
if (isMultiplayer && {isServer}) then {
    private ["_allMapMarkers", "_allMapMarkersProperties", "_index"];

    _allMapMarkers = GETGVAR(allMapMarkers,[]);
    _allMapMarkersProperties = GETGVAR(allMapMarkersProperties,[]);

    _index = _allMapMarkers find _marker;

    if (_index == -1) then {
        _allMapMarkers pushBack _marker;
        _allMapMarkersProperties pushBack _data;
    } else {
        _allMapMarkers set [_index, _marker];
        _allMapMarkersProperties set [_index, _data];
    };

    GVAR(allMapMarkers) = _allMapMarkers;
    GVAR(allMapMarkersProperties) = _allMapMarkersProperties;
};
