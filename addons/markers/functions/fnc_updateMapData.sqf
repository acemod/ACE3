/*
 * Author: commy2, SzwedzikPL
 * Updates markers data on server
 *
 * Arguments:
 * 0: Map for which markers are assigned to <STRING>
 * 1: Markers data in format [newMarkersData, deletedMarkers] <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params ["_map", "_mapData"];
TRACE_2("updateMapData",_map,_mapData);

_mapData params ["_newMarkers", "_deletedMarkers"];

//can't update markers data if map is not unique
if (!(_map call FUNC(isUniqueMap))) exitWith {};

private _mapMarkers = missionNamespace getVariable [format ["%1_markers", _map], []];
private _mapMarkersProperties = missionNamespace getVariable [format ["%1_markersProperties", _map], []];

{
    _x params ["_marker", "_data"];
    private _index = _mapMarkers find _marker;

    if (_index == -1) then {
        _mapMarkers pushBack _marker;
        _mapMarkersProperties pushBack _data;
    } else {
        _mapMarkers set [_index, _marker];
        _mapMarkersProperties set [_index, _data];
    };
} forEach _newMarkers;

{
    private _index = _mapMarkers find _x;
    if (_index >= 0) then {
        _mapMarkers deleteAt _index;
        _mapMarkersProperties deleteAt _index;
    };
} forEach _deletedMarkers;

missionNamespace setVariable [format ["%1_markers", _map], _mapMarkers];
missionNamespace setVariable [format ["%1_markersProperties", _map], _mapMarkersProperties];
