/*
fnc_removeRouteMarker.sqf
Usage: Removes route marker nearest to given position
Author: Glowbal

Arguments: array [position (Position 3D)]
		0: Position. Format: 3D [ x, y, z]
Returns: Void

Affects: Global
Executes: Local

Example:
	[[50,20,0] call cse_fnc_removeRouteMarker_CC;
*/

private ["_mpSync","_args","_nearest","_lastestCount","_pos","_count","_position"];
if (count _this < 2) exitwith {
	_mpSync = [_this, 1, "", [""]] call BIS_fnc_param;

	if (isnil "_mpSync") then {
		_mpSync = "";
	};
	if (_mpSync != "MP_SYNC") then {
		_args = _this + ["MP_SYNC"];
		[_args, "cse_fnc_removeRouteMarker_CC", true, true] spawn BIS_fnc_MP;
	};
};
if (isnil "CSE_ROUTE_MARKER_COLLECTION_CC") then {
	// This is a fix for waiting MP JIP synchronization.
	waituntil{!isnil "CSE_ROUTE_MARKER_COLLECTION_CC"};
};

_position = [_this, 0, [0,0,0], [[]],3] call BIS_fnc_param;
_count = 0;
_nearest = 25;
_lastestCount = -1;
{
	_pos = (_x select 0);
	if ((_pos distance _position) < _nearest) then {
		_nearest = _pos distance _position;
		_lastestCount = _count;
	};
	_count = _count + 1;
}count CSE_ROUTE_MARKER_COLLECTION_CC;
if (_lastestCount < 0) exitwith {};
CSE_ROUTE_MARKER_COLLECTION_CC set [ _lastestCount, "REMOVE"];
CSE_ROUTE_MARKER_COLLECTION_CC = CSE_ROUTE_MARKER_COLLECTION_CC - ["REMOVE"];
