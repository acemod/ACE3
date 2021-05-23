#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets up TERCOM state arrays
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_TERCOM_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];

// need a number that denotes maximum grid width at specified resolution
// 3 grid cells in either direction
#define MAX_GRID_WIDTH 5

private _minResolution = 50;
private _maxResolution = 300;

private _waypoints = [
    [[22255.6,14042.3,0], 50],
    [[19708.9,14668.1,0], 50],
    [[17334.5,16922.6,0], 50],
    [[13809.5,18171.9,0], 30],
    [[11167.8,20575.4,0], 20],
    [[6294.59,20780.3,0], 20],
    [[4552.04,21492.6,0], 20]
];
private _heightmap = [];

private _maxWaypoints = (count _waypoints) - 1;

{
    // at last waypoint, dont process
    if (_forEachIndex == _maxWaypoints) exitWith {};
    private _nextWaypoint = _waypoints select (_forEachIndex + 1);

    _x params ["_positionA", "_cruiseHeight"];
    _nextWaypoint params ["_positionB", "_cruiseHeight"];

    private _distance = _positionA vectorDistance _positionB;
    private _direction = _positionA vectorFromTo _positionB;
    private _normalDirection = [-(_direction#1), _direction#0, _direction#2];

    private _resolution = linearConversion [0, 1, (_forEachIndex + 1) / _maxWaypoints, _maxResolution, _minResolution];

    private _startingGridPos = _positionA vectorAdd (_normalDirection vectorMultiply (MAX_GRID_WIDTH * _resolution));
    _startingGridPos = _startingGridPos vectorDiff (_normalDirection vectorMultiply -(_resolution * 0.5));

    for "_y" from 0 to (MAX_GRID_WIDTH * 2) do {
        private _gridPos = _startingGridPos vectorAdd (_normalDirection vectorMultiply -(_resolution * _y));
        private _firstHeightmapCell = [];
        for "_x" from 0 to ceil (_distance / _resolution) step 1 do {
            private _heightAtPos = 0 max getTerrainHeightASL _gridPos;

            _firstHeightmapCell pushBack [_gridPos#0, _gridPos#1, _heightAtPos];
            _gridPos = _gridPos vectorAdd (_direction vectorMultiply _resolution);
        };
        _heightmap pushBack [_firstHeightmapCell, _resolution * MAX_GRID_WIDTH];
    };

} forEach _waypoints;

{
    {
        private _m = createMarker [format ["%1", random 1e10], _x];
        _m setMarkerType "mil_dot";
        _m setMarkerText format ["%1m", _x select 2];
    } forEach (_x select 0);
} forEach _heightmap;

{
    _x params ["_position", "_cruiseAltitude"];
    private _m = createMarker [format ["%1", random 1e10], _position];
    _m setMarkerType "mil_dot";
    _m setMarkerText format ["%1m", _cruiseAltitude];
    _m setMarkerColor "ColorRed";
} forEach _waypoints;

_seekerStateParams set [0, []]; // internal buffer of heights
_seekerStateParams set [1, getPosASLVisual _projectile]; // calculated current position - simulating INS guidance
_seekerStateParams set [2, TERCOM_STATE_SEEKING_BASKET]; // current state
_seekerStateParams set [3, 0]; // current waypoint
_seekerStateParams set [4, _waypoints];
_seekerStateParams set [5, _heightmap];

