// by commy2
#include "script_component.hpp"

// recieve remote marker data
[QGVAR(setMarkerNetwork), LINKFUNC(setMarkerNetwork)] call CBA_fnc_addEventHandler;

// recieve marker data for JIP
[QGVAR(setMarkerJIP), LINKFUNC(setMarkerJIP)] call CBA_fnc_addEventHandler;

// request marker data for JIP
if (isMultiplayer && {!isServer} && {hasInterface}) then {
    [QGVAR(sendMarkersJIP), CBA_clientID] call CBA_fnc_serverEvent;
};

GVAR(mapDisplaysWithDrawEHs) = [];
GVAR(currentMarkerPosition) = [];
GVAR(currentMarkerAngle) = 0;
GVAR(currentMarkerScale) = 1;
GVAR(currentMarkerColorConfigName) = "";
GVAR(currentMarkerConfigName) = "";

GVAR(userPlacedMarkers) = [];

// set marker pos local on every machine (prevent markers visible for everyone)
[QGVAR(setMarkerPosLocal), {
    params ["_marker", "_pos"];
    _marker setMarkerPosLocal _pos;

    // handle JIP
    if (isServer) then {
        private _index = (GETGVAR(allMapMarkers,[])) find _marker; // case-sensitive, but should be fine

        if (_index < 0) exitWith {
            if (!isMultiplayer) exitWith {};
            WARNING_1("Could not find data for %1",_marker);
        };

        private _data = GVAR(allMapMarkersProperties) select _index;
        _data set [2, _pos];
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(markerNumbers) = createHashMap;
    [QGVAR(numberMarker), {
        params ["_marker", "_side"];
        TRACE_2("numberMarker", _marker, _side);
        private _number = (GVAR(markerNumbers) getOrDefault [_side, 0]) + 1;
        _marker setMarkerText str _number;
        GVAR(markerNumbers) set [_side, _number];
    }] call CBA_fnc_addEventHandler;
};
if (hasInterface) then {
    GVAR(numberNextMarker) = false;
    ["ace_markers_editingMarker", {
        params ["_marker", "_display"];
        TRACE_2("editingMarker",_marker,_display);

        if (!GVAR(quickNumberEnabled)) exitWith {};
        if (!cba_events_alt) exitWith {};
        if (_marker != "") exitWith {}; // editing an existing marker

        GVAR(numberNextMarker) = true;
        _display closeDisplay 1;
    }] call CBA_fnc_addEventHandler;

    ["ace_markers_markerPlaced", {
        if (!GVAR(numberNextMarker)) exitWith {};
        GVAR(numberNextMarker) = false;
        params ["_newestMarker"];
        TRACE_1("markerPlaced",_newestMarker);
        GVAR(currentMarkerConfigName) = QGVAR(textOnly);
        [QGVAR(numberMarker), [_newestMarker, side group ace_player]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_addEventHandler;
};
