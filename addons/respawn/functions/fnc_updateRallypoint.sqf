// by commy2
#include "script_component.hpp"

private ["_rallypoint", "_side", "_position"];

_rallypoint = _this select 0;
_side = _this select 1;
_position = _this select 2;

if (!hasInterface) exitWith {};

private ["_marker", "_markerDate"];

_marker = _rallypoint getVariable [QGVAR(marker), ""];
_markerDate = _rallypoint getVariable [QGVAR(markerDate), ""];

_marker setMarkerPosLocal _position;
_marker setMarkerTextLocal _markerDate;
