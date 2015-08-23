#include "script_component.hpp"

ADDON = false;

PREP(initInsertMarker);
PREP(mapDrawEH);
PREP(onLBSelChangedColor);
PREP(onLBSelChangedShape);
PREP(onSliderPosChangedAngle);
PREP(placeMarker);
PREP(sendMarkersJIP);
PREP(setMarkerJIP);
PREP(setMarkerNetwork);

private ["_config", "_marker", "_a", "_scope", "_icon", "_rgba", "_name"];

// init marker types
if (isNil QGVAR(MarkersCache)) then {
    _config = configfile >> "CfgMarkers";
    GVAR(MarkersCache) = [];

    for "_a" from 0 to (count _config - 1) do {
        _marker = _config select _a;
        _scope = getNumber (_marker >> "scope");
        if (_scope == 2) then {
            _name = getText (_marker >> "name");
            _icon = getText (_marker >> "icon");
            GVAR(MarkersCache) pushBack [_name, _a, _icon];
        };
    };
};

// init marker colors
if (isNil QGVAR(MarkerColorsCache)) then {
    _config = configfile >> "CfgMarkerColors";
    GVAR(MarkerColorsCache) = [];

    for "_a" from 0 to (count _config - 1) do {
        _marker = _config select _a;
        _scope = getNumber (_marker >> "scope");
        if (_scope == 2) then {
            _name = getText (_marker >> "name");
            _rgba = getArray (_marker >> "color");
            {
                if (typeName _x != "SCALAR") then {
                    _rgba set [_forEachIndex, call compile _x];
                };
            } forEach _rgba;
            _rgba params ["_red", "_green", "_blue", "_alpha"];
            _icon = format ["#(argb,8,8,3)color(%1,%2,%3,%4)", _red, _green, _blue, _alpha];

            GVAR(MarkerColorsCache) pushBack [_name, _a, _icon];
        };
    };
};

//Server Sync JIP markers:
[QGVAR(sendMarkersJIP), FUNC(sendMarkersJIP)] call EFUNC(common,addEventHandler);

ADDON = true;
