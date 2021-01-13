#include "script_component.hpp"
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
 * [[],[],dummyLogic] call ace_markers_fnc_setMarkerNetwork;
 *
 * Public: No
 */

params ["_marker", "_data"];
TRACE_2("params",_marker,_data);
_data params ["_markerClassname", "_colorClassname", "_pos", "_dir"];

private _config = configfile >> "CfgMarkers" >> _markerClassname;

if (!isClass _config) then {
    WARNING("CfgMarker not found, changed to milDot");
    _config = configFile >> "CfgMarkers" >> "MilDot";
};

_marker setMarkerTypeLocal configName _config;

_config = configfile >> "CfgMarkerColors" >> _colorClassname;

if (!isClass _config) then {
    WARNING("CfgMarkerColors not found, changed to Default");
    _config = configFile >> "CfgMarkerColors" >> "Default";
};

_marker setMarkerColorLocal configName _config;

_marker setMarkerPosLocal _pos;
_marker setMarkerDirLocal _dir;

// save properties on server machine for JIP, marker editing ready
if (isMultiplayer && {isServer}) then {
    private _allMapMarkers = GETGVAR(allMapMarkers,[]);
    private _allMapMarkersProperties = GETGVAR(allMapMarkersProperties,[]);

    private _index = _allMapMarkers find _marker;

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
