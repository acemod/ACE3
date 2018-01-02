// by commy2
#include "script_component.hpp"

// recieve remote marker data
[QGVAR(setMarkerNetwork), {_this call DFUNC(setMarkerNetwork)}] call CBA_fnc_addEventHandler;

// recieve marker data for JIP
[QGVAR(setMarkerJIP), {_this call DFUNC(setMarkerJIP)}] call CBA_fnc_addEventHandler;

// request marker data for JIP
if (isMultiplayer && {!isServer} && {hasInterface}) then {
    [QGVAR(sendMarkersJIP), CBA_clientID] call CBA_fnc_serverEvent;
};

GVAR(mapDisplaysWithDrawEHs) = [];
GVAR(currentMarkerPosition) = [];
GVAR(currentMarkerAngle) = 0;
GVAR(currentMarkerColorConfigName) = "";
GVAR(currentMarkerConfigName) = "";

// set marker pos local on every machine (prevent markers visible for everyone)
[QGVAR(setMarkerPosLocal), {
    params ["_marker", "_pos"];
    _marker setMarkerPosLocal _pos;

    // handle JIP
    if (isServer) then {
        private _index = (GETGVAR(allMapMarkers,[])) find _marker; // case-sensitive, but should be fine

        if (_index < 0) exitWith {
            ERROR_1("Could not find data for %1", _marker);
        };

        private _data = GVAR(allMapMarkersProperties) select _index;
        _data set [2, _pos];
    };
}] call CBA_fnc_addEventHandler;
