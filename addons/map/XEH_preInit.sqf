#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP(blueForceTrackingModule);
PREP(blueForceTrackingUpdate);
PREP(determineMapLight);
PREP(determineZoom);
PREP(getMapGridFromPos);
PREP(getMGRSdata);
PREP(moduleMap);
PREP(onDrawMap);
PREP(updateMapEffects);

//Prepare variables for FUNC(getMapGridFromPos):
private["_length", "_mapSize", "_northingReversed", "_offsetPadding", "_originGrid"];
_northingReversed = [] call CBA_fnc_northingReversed;
_mapsize = getNumber (ConfigFile >> "CfgWorlds" >> worldName >> "mapSize");

_originGrid = if (_northingReversed) then {
    mapGridPosition [0,_mapsize,0];
} else {
    mapGridPosition [0,0,0];
};

_length = (count _originGrid) / 2;
_offsetPadding = switch (_length) do {
    case 1: {"0000"};
    case 2: {"000"};
    case 3: {"00"};
    case 4: {"0"};
    default {""};
};

GVAR(gridOffsetX) = parseNumber ((_originGrid select [0,_length]) + _offsetPadding);
GVAR(gridOffsetY) = parseNumber ((_originGrid select [_length,_length]) + _offsetPadding);
if (_northingReversed) then {
    GVAR(gridOffsetY) = GVAR(gridOffsetY) + _mapSize;
};

ADDON = true;
