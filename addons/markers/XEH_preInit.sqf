#include "script_component.hpp"

PREP(initInsertMarker);
PREP(onLBSelChangedColor);
PREP(onLBSelChangedShape);
PREP(onSliderPosChangedAngle);
PREP(placeMarker);
PREP(sendMarkersJIP);
PREP(setMarkerJIP);
PREP(setMarkerNetwork);

// init marker types
if (isNil QGVAR(MarkersCache)) then {
    _config = configfile >> "CfgMarkers";
    _index = 0;

    GVAR(MarkersCache) = [];

    for "_a" from 0 to (count _config - 1) do {
        _marker = _config select _a;

        _scope = getNumber (_marker >> "scope");
        _name = getText (_marker >> "name");
        _icon = getText (_marker >> "icon");

        if (_scope == 2) then {
            _shape lbAdd _name;
            _shape lbSetValue [_index, _a];
            _shape lbSetPicture [_index, _icon];

            GVAR(MarkersCache) pushBack [_name, _a, _icon];

            _index = _index + 1;
        };
    };
};

// init marker colors
if (isNil QGVAR(MarkerColorsCache)) then {
    _config = configfile >> "CfgMarkerColors";
    _index = 0;

    GVAR(MarkerColorsCache) = [];

    for "_a" from 0 to (count _config - 1) do {
        _marker = _config select _a;

        _scope = getNumber (_marker >> "scope");
        _name = getText (_marker >> "name");

        if (_scope == 2) then {
            _color lbAdd _name;
            _color lbSetValue [_index, _a];

            _rgba = getArray (_marker >> "color");

            {
                if (typeName _x != "SCALAR") then {
                    _rgba set [_forEachIndex, call compile _x];
                };
            } forEach _rgba;

            _icon = format ["#(argb,8,8,3)color(%1,%2,%3,%4)", _rgba select 0, _rgba select 1, _rgba select 2, _rgba select 3];

            _color lbSetPicture [_index, _icon];

            GVAR(MarkerColorsCache) pushBack [_name, _a, _icon];

            _index = _index + 1;
        };
    };
};

[QGVAR(sendMarkersJIP), FUNC(sendMarkersJIP)] call EFUNC(common,addEventHandler);
