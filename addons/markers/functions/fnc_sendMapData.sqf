/*
 * Author: commy2, SzwedzikPL
 * Server: Recives a dummy logic and client map class, sends map data back to the owner.
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

if (!isServer) exitWith {};

params ["_clientLogic", "_clientMap"];
TRACE_2("sendMapData",_clientLogic,_clientMap);

private _newClientMap = "";
private _mapData = [[],[]];

if (GVAR(enableUniqueMaps)) then {
    if (_clientMap != "" && {_clientMap call FUNC(isMap)}) then {
        if (_clientMap call FUNC(isUniqueMap)) then {
            //client map is unique, send him markers of this map
            private _mapMarkers = GVAR(mapNamespace) getVariable (format ["%1_markers", _clientMap]);
            if (isNil "_mapMarkers") then {_mapMarkers = [];};
            private _mapMarkersProperties = GVAR(mapNamespace) getVariable (format ["%1_markersProperties", _clientMap]);
            if (isNil "_mapMarkersProperties") then {_mapMarkersProperties = [];};
            _newClientMap = _clientMap;
            _mapData = [_mapMarkers, _mapMarkersProperties];
        } else {
            //client mapa is not unique, send him order to replace with unique one
            _newClientMap = [] call FUNC(registerMap);
        };
    };
} else {
    //if uniqueMaps disabled send data of all markers (JIP support)
    _newClientMap = _clientMap;

    private _allMapMarkers = GVAR(mapNamespace) getVariable QGVAR(allMapMarkers);
    if (isNil "_allMapMarkers") then {_allMapMarkers = [];};
    private _allMapMarkersProperties = GVAR(mapNamespace) getVariable QGVAR(allMapMarkersProperties);
    if (isNil "_allMapMarkersProperties") then {_allMapMarkersProperties = [];};
    _mapData = [_allMapMarkers, _allMapMarkersProperties];
};

if (isMultiplayer) then {
    [QGVAR(loadMapData), [_clientLogic], [_newClientMap, _mapData]] call EFUNC(common,targetEvent);
} else {
    [QGVAR(loadMapData), [_newClientMap, _mapData]] call EFUNC(common,localEvent);
};
