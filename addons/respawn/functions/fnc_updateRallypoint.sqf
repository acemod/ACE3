// by commy2
#include "script_component.hpp"

private ["_rallypoint", "_side"];

_rallypoint = _this select 0;
_side = _this select 1;

if (!hasInterface) exitWith {};

private ["_marker", "_markerDate"];

_marker = _rallypoint getVariable [QGVAR(marker), ""];
_markerDate = _rallypoint getVariable [QGVAR(markerDate), ""];

_marker setMarkerPosLocal getPosASL _rallypoint;
_marker setMarkerTextLocal _markerDate;
