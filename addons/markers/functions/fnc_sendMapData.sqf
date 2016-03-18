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

if(!isServer) exitWith {};

params ["_clientLogic", "_clientMap"];
TRACE_2("sendMapData",_clientLogic,_clientMap);

private _newClientMap = "";
private _mapData = [[],[]];

if(GVAR(enableUniqueMaps)) then {
    if(_clientMap != "" && {_clientMap call FUNC(isMap)}) then {
        private _mapID = _clientMap call FUNC(getMapID);
        if(_mapID != 0) then {
            //client map is unique, send him markers of this map
            private _mapMarkers = missionNamespace getVariable [format ["%1_%2", QGVAR(allMapMarkers), _mapID], []];
            private _mapMarkersProperties = missionNamespace getVariable [format ["%1_%2", QGVAR(allMapMarkersProperties), _mapID], []];
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
    _mapData = [GETGVAR(allMapMarkers,[]), GETGVAR(allMapMarkersProperties,[])];
};

if(isMultiplayer) then {
    [QGVAR(loadMapData), [_clientLogic], [_newClientMap, _mapData]] call EFUNC(common,targetEvent);
} else {
    [QGVAR(loadMapData), [_newClientMap, _mapData]] call EFUNC(common,localEvent);
};
