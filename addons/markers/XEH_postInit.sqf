// by commy2
#include "script_component.hpp"

// receive remote marker data
[QGVAR(setMarkerNetwork), LINKFUNC(setMarkerNetwork)] call CBA_fnc_addEventHandler;

// receive marker data for JIP
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

if (hasInterface) then {
    GVAR(numberNextMarker) = false;
    GVAR(numberLocalLast) = 0;
    [QGVAR(editingMarker), {
        params ["_marker", "_display"];
        TRACE_2("editingMarker",_marker,_display);
        if (GVAR(quickNumberMarks) == 0) exitWith {};
        if (!cba_events_alt) exitWith {}; // not available before mission start
        if (_marker != "") exitWith {}; // editing an existing marker

        private _description = _display displayCtrl IDC_INSERT_MARKER;
        private _number = if ((GVAR(quickNumberMarks) == 1) || {currentChannel != 1}) then {
            GVAR(numberLocalLast) = GVAR(numberLocalLast) + 1;
            GVAR(numberLocalLast) // local numbering
        } else {
            private _hash = missionNamespace getVariable [QGVAR(numberSideLast), createHashMap];
            private _side = side group player;
            private _next = (_hash getOrDefault [_side, 0]) + 1;
            _hash set [_side, _next];
            missionNamespace setVariable [QGVAR(numberSideLast), _hash, true];
            _next // side-synchronized numbering
        };
        _description ctrlSetText str _number;
        GVAR(numberNextMarker) = true;
        _display closeDisplay 1; // push ok button
    }] call CBA_fnc_addEventHandler;

    [QGVAR(markerPlaced), {
        params ["_newestMarker"];
        TRACE_1("markerPlaced",_newestMarker);
        if (missionNamespace getVariable [QGVAR(numberNextMarker), false]) then {
            // set marker type to text only (temporarily for this marker)
            GVAR(numberNextMarker) = false;
            GVAR(currentMarkerConfigName) = QGVAR(textOnly);
        } else {
            // try to update our local marker index when placing a text-only marker with a number
            if ((GVAR(quickNumberMarks) == 2) && {currentChannel == 1}) exitWith {};
            if ((markerType _newestMarker) != QGVAR(textOnly)) exitWith {};
            private _text = markerText _newestMarker;
            private _count = count _text;
            private _isNumber = true;
            if (_count > 6) exitWith {};
            for "_i" from 0 to (_count - 1) do {
                if !((_text select [_i, 1]) in "0123456789") exitWith { _isNumber = false; };
            };
            if (!_isNumber) exitWith {};
            GVAR(numberLocalLast) = parseNumber _text;
            TRACE_1("Updated local marker number",GVAR(numberLocalLast));
        };
    }] call CBA_fnc_addEventHandler;
};
