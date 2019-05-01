#include "script_component.hpp"
/*
 * Author: commy2
 * Client: Recives a marker data from server.
 *
 * Arguments:
 * 0: Array of map marker names <ARRAY>
 * 1: Array of map marker data <ARRAY>
 * 2: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[],[],dummyLogic] call ace_markers_fnc_setMarkerJIP;
 *
 * Public: No
 */

params ["_allMapMarkers", "_allMapMarkersProperties"];
TRACE_2("params",_allMapMarkers,_allMapMarkersProperties);

{
    private _index = _allMapMarkers find _x;

    if (_index != -1) then {
        private _data = _allMapMarkersProperties select _index;
        _data params ["_markerClassname", "_colorClassname", "_pos", "_dir"];

        private _config = (configfile >> "CfgMarkers") >> _markerClassname;

        if (!isClass _config) then {
            WARNING("CfgMarker not found, changed to milDot");
            _config = configFile >> "CfgMarkers" >> "MilDot";
        };

        _x setMarkerTypeLocal configName _config;

        _config = configfile >> "CfgMarkerColors" >> _colorClassname;

        if (!isClass _config) then {
            WARNING("CfgMarkerColors not found, changed to Default");
            _config = configFile >> "CfgMarkerColors" >> "Default";
        };

        _x setMarkerColorLocal configName _config;

        _x setMarkerPosLocal _pos;
        _x setMarkerDirLocal _dir;
    };
    false
} count allMapMarkers;
