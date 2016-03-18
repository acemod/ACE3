#include "script_component.hpp"

[QGVAR(loadMapData), DFUNC(loadMapData)] call EFUNC(common,addEventHandler);
[QGVAR(setMarkerGlobal), DFUNC(setMarkerGlobal)] call EFUNC(common,addEventHandler);
[QGVAR(loadBriefingMarkers), DFUNC(loadBriefingMarkers)] call EFUNC(common,addEventHandler);
[QGVAR(onMapItemChange), DFUNC(onMapChange)] call EFUNC(common,addEventHandler);

if(hasInterface) then {
    //request map data from server
    ["playerChanged", {
        GVAR(currentMapID) = -1;
        private _assignedMap = ACE_player call FUNC(getAssignedMap);
        GVAR(currentMap) = _assignedMap;
        [QGVAR(onMapItemChange), [_assignedMap]] call EFUNC(common,localEvent);
    }] call EFUNC(common,addEventHandler);

    //request map data from server on each inventory change (after first request is done for this ACE_player)
    ["playerInventoryChanged", {
        if(!GVAR(enableUniqueMaps) || {GVAR(currentMapID) < 0}) exitWith {};
        private _assignedMap = ACE_player call FUNC(getAssignedMap);
        if(GVAR(currentMap) != _assignedMap) then {
            GVAR(currentMap) = _assignedMap;
            [QGVAR(onMapItemChange), [_assignedMap]] call EFUNC(common,localEvent);
        };
    }] call EFUNC(common,addEventHandler);

    //check marker changes after map is closed
    ["visibleMapChanged", {
        params ["", "_mapOn"];
        TRACE_1("visibleMapChanged",_mapOn);

        if(!GVAR(enableUniqueMaps)) exitWith {};

        if (_mapOn) then {
            GVAR(newMapMarkers) = [];
        } else {
            private _assignedMap = ACE_player call FUNC(getAssignedMap);
            if(_assignedMap == "") exitWith {};

            //can't update markers data if map is not unique
            private _mapID = _assignedMap call FUNC(getMapID);
            if(_mapID <= 0) exitWith {};

            //find any deleted markers
            private _deletedMarkers = [];
            {
                if(!(_x in allMapMarkers)) then {
                    _deletedMarkers pushBack _x;
                    private _markerIndex = GVAR(currentMapMarkers) find _x;
                    GVAR(currentMapMarkers) deleteAt _markerIndex;
                    GVAR(currentMapMarkersProperties) deleteAt _markerIndex;
                };
            } forEach +GVAR(currentMapMarkers);

            if(count GVAR(newMapMarkers) > 0 || {count _deletedMarkers > 0}) then {
                //update markers data on server
                [QGVAR(updateMapData), [_assignedMap, [GVAR(newMapMarkers), _deletedMarkers]]] call EFUNC(common,serverEvent);
            };
        };
    }] call EFUNC(common,addEventHandler);

    //save post briefing markers for access verification during loadBriefingMarkers event
    [{
        if(!didJIP && {GVAR(enableUniqueMaps)}) then {
            TRACE_1("postBriefingMarkers saved",allMapMarkers);
            GVAR(postBriefingMarkers) = allMapMarkers;
        };
    }, [], 0.05] call EFUNC(common,waitAndExecute);
};

if(isServer) then {
    //after mission start send order each client to add all briefing markers to their unique maps and delete global markers
    [{
        if(GVAR(enableUniqueMaps)) then {
            [QGVAR(loadBriefingMarkers), []] call EFUNC(common,globalEvent);
        };
    }, [], 0.5] call EFUNC(common,waitAndExecute);
};
