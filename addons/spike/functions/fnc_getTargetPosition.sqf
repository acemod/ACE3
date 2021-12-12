#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Return the position of a potential EO target via a "edge detection" algorithm. Compares object bounding boxes to see what we are most likely hitting
 *
 * Arguments:
 * 1: Origin <ARRAY>
 * 2: Direction <ARRAY>
 * 3: If we are designating <NUMBER>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_spike_fnc_getTargetPosition;
 *
 * Public: No
 */
params ["_origin", "_direction", "_designateInput", "_seekerTargetPos", ["_ignoreObject", objNull]];

private _nearObjects = [];

private _intersections = lineIntersectsSurfaces [_origin, _origin vectorAdd (_direction vectorMultiply 5000), _ignoreObject, objNull, true, 1, "FIRE", "VIEW", true];
if (_intersections isNotEqualTo []) then {
    (_intersections#0) params ["_intersectPos", "", "_object"];

    if (_designateInput == 1) then {
        _seekerTargetPos = _intersectPos;
    };

    _nearObjects = (ASLtoAGL _seekerTargetPos) nearObjects ["AllVehicles", 5];

    if (_designateInput == 1 && { !isNull _object }) then {
        _nearObjects pushBack _object;
    };
};

if (_nearObjects isNotEqualTo []) then {
    // I want to prefer the designated position on the object moreso than the bounds of the object
    private _averagePosition = _seekerTargetPos vectorMultiply 15;
    private _averagePositionCounter = 15;

    private _closestObject = objNull;
    private _closestDistance = 1e10;

    {
        if ((getPosASLVisual _x) vectorDistanceSqr _seekerTargetPos < _closestDistance) then {
            _closestDistance = (getPosASLVisual _x) vectorDistanceSqr _seekerTargetPos;
            _closestObject = _x;
        };
    } forEach _nearObjects;

    private _boundingBox = 0 boundingBoxReal _closestObject;

    // Project target bounding box onto screen and do a real bad edge detection check
    _boundingBox params ["_min", "_max"];
    _min params ["_x0", "_y0", "_z0"];
    _max params ["_x1", "_y1", "_z1"];

    private _utl = _closestObject modelToWorldVisualWorld [_x0, _y0, _z0];
    private _utr = _closestObject modelToWorldVisualWorld [_x1, _y0, _z0];
    private _ubr = _closestObject modelToWorldVisualWorld [_x1, _y1, _z0];
    private _ubl = _closestObject modelToWorldVisualWorld [_x0, _y1, _z0];

    private _dtl = _closestObject modelToWorldVisualWorld [_x0, _y0, _z1];
    private _dtr = _closestObject modelToWorldVisualWorld [_x1, _y0, _z1];
    private _dbr = _closestObject modelToWorldVisualWorld [_x1, _y1, _z1];
    private _dbl = _closestObject modelToWorldVisualWorld [_x0, _y1, _z1];

    {
        private _intersections = lineIntersectsSurfaces [_origin, _x, _ignoreObject, objNull, false, 16];
        if (_intersections isEqualTo []) then {
            _averagePosition = _averagePosition vectorAdd _x;
            _averagePositionCounter = _averagePositionCounter + 1;
        } else {
            {
                _x params ["_surfacePosition"];
                _averagePosition = _averagePosition vectorAdd _surfacePosition;
                _averagePositionCounter = _averagePositionCounter + 1;
            } forEach _intersections;
        }
    } forEach [_utl, _utr, _ubr, _ubl, _dtl, _dtr, _dbr, _dbl];

    _seekerTargetPos = _averagePosition vectorMultiply (1 / _averagePositionCounter);
} else {
    if (_designateInput == 1) then {
        _seekerTargetPos = [0, 0, 0];
    };
};

_seekerTargetPos

