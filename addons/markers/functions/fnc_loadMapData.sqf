/*
 * Author: commy2, SzwedzikPL
 * Client: Recives map data from server.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Map class <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_newMap", "_mapData"];
TRACE_2("loadMapData",_newMap,_mapData);

private _currentMap = ACE_player call FUNC(getAssignedMap);
if (_currentMap != "" && {_newMap != ""}) then {
    _mapData params ["_allMapMarkers", "_allMapMarkersProperties"];

    if (GVAR(enableUniqueMaps)) then {
        {
            private _marker = createMarkerLocal [_x, [0,0,0]];
            private _data = _allMapMarkersProperties select _forEachIndex;
            [_marker, _data] call FUNC(setMarkerLocal);
        } forEach _allMapMarkers;
        {deleteMarkerLocal _x} forEach GVAR(currentMapMarkers);
        GVAR(currentMapMarkers) = _allMapMarkers;
        GVAR(currentMapMarkersProperties) = _allMapMarkersProperties;

        if (GVAR(currentMap) != _newMap) then {
            GVAR(currentMap) = _newMap;
            ACE_player unlinkItem _currentMap;
            ACE_player linkItem _newMap;
        };
    } else {
        {
            if (_x in allMapMarkers) then {
                private _data = _allMapMarkersProperties select _forEachIndex;
                [_x, _data] call FUNC(setMarkerLocal);
            };
        } forEach _allMapMarkers;
    };
};

if (isMultiplayer) then {
    private _group = group GVAR(localLogic);
    deleteVehicle GVAR(localLogic);
    GVAR(localLogic) = nil;
    deleteGroup _group;
};
