#include "script_component.hpp"

[QGVAR(loadMapData), DFUNC(loadMapData)] call EFUNC(common,addEventHandler);
[QGVAR(setMarkerGlobal), DFUNC(setMarkerGlobal)] call EFUNC(common,addEventHandler);
[QGVAR(loadBriefingMarkers), DFUNC(loadBriefingMarkers)] call EFUNC(common,addEventHandler);
[QGVAR(onMapItemChange), DFUNC(onMapChange)] call EFUNC(common,addEventHandler);

if (hasInterface) then {
    //request map data from server
    ["playerChanged", {
        private _assignedMap = ACE_player call FUNC(getAssignedMap);
        GVAR(currentMap) = "";
        [QGVAR(onMapItemChange), [_assignedMap]] call EFUNC(common,localEvent);
        GVAR(currentMap) = _assignedMap;
    }] call EFUNC(common,addEventHandler);

    ["SettingsInitialized", {
        if (!GVAR(enableUniqueMaps)) exitWith {};

        //request map data from server on each inventory change
        ["playerInventoryChanged", {
            private _assignedMap = ACE_player call FUNC(getAssignedMap);
            if (GVAR(currentMap) != _assignedMap) then {
                //force map update in case of map change when map is opened
                [] call FUNC(sendMapUpdate);

                GVAR(currentMap) = _assignedMap;
                [QGVAR(onMapItemChange), [_assignedMap]] call EFUNC(common,localEvent);
            };
        }] call EFUNC(common,addEventHandler);

        //check marker changes after map is closed
        ["visibleMapChanged", {
            params ["", "_mapOn"];
            TRACE_1("visibleMapChanged",_mapOn);

            if (_mapOn) then {
                GVAR(newMapMarkers) = [];
            } else {
                [] call FUNC(sendMapUpdate);
            };
        }] call EFUNC(common,addEventHandler);

        //save post briefing markers for access verification during loadBriefingMarkers event
        [{
            if (!didJIP) then {
                TRACE_1("postBriefingMarkers saved",allMapMarkers);
                GVAR(postBriefingMarkers) = allMapMarkers;
            };
        }, [], 0.05] call EFUNC(common,waitAndExecute);
    }] call EFUNC(common,addEventHandler);
};

if (isServer) then {
    //after mission start send order each client to add all briefing markers to their unique maps and delete global markers
    [{
        [QGVAR(loadBriefingMarkers), []] call EFUNC(common,globalEvent);
    }, [], 0.5] call EFUNC(common,waitAndExecute);
};
