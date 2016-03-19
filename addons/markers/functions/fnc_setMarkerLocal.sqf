/*
 * Author: commy2
 * Sets marker on client
 *
 * Arguments:
 * 0: Markername <STRING>
 * 1: Marker Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_marker", "_data"];
_data params ["_markerClassname", "_colorClassname", "_pos", "_dir", "_text"];

private _config = (configfile >> "CfgMarkers") >> _markerClassname;

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

if (_text != "") then {_marker setMarkerTextLocal _text;};

_marker setMarkerPosLocal _pos;
_marker setMarkerDirLocal _dir;
