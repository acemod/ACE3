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
 * Nothing
 *
 * Example:
 * [[],[],dummyLogic] call ace_markers_fnc_setMarkerJIP;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_index", "_data", "_config"];

PARAMS_3(_allMapMarkers,_allMapMarkersProperties,_logic);

{
    _index = _allMapMarkers find _x;

    if (_index != -1) then {
        _data = _allMapMarkersProperties select _index;

        _config = (configfile >> "CfgMarkers") >> (_data select 0);
        if (!isClass _config) then {
            WARNING("CfgMarker not found, changed to milDot");
            _config == (configFile >> "CfgMarkers" >> "MilDot");
        };
        _x setMarkerTypeLocal (configName _config);

        _config = (configfile >> "CfgMarkerColors") >> (_data select 1);
        if (!isClass _config) then {
            WARNING("CfgMarkerColors not found, changed to Default");
            _config == (configFile >> "CfgMarkerColors" >> "Default");
        };
        _x setMarkerColorLocal (configName _config);

        _x setMarkerPosLocal (_data select 2);
        _x setMarkerDirLocal (_data select 3);
    };
} forEach allMapMarkers;

deleteVehicle _logic;
