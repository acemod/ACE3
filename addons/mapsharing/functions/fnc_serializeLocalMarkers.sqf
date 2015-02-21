#include "script_component.hpp"

_markerData = [];

{
    _markerData pushBack [(markerPos _x), (markerShape _x), (markerText _x), (markerDir _x), (markerColor _x), (markerAlpha _x), (markerType _x), (markerSize _x), (markerBrush _x)];
} forEach allMapMarkers;

_markerData
