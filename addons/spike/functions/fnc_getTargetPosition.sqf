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
#define CHECK_DISTANCE 10
#define SEEKER_BIAS 50
params ["_origin", "_direction", "_designateInput", "_seekerTargetPos", "_seeker", ["_ignoreObject", objNull]];

scopeName "main";
private _nearObjects = [];

private _desiredObject = objNull;
private _intersections = lineIntersectsSurfaces [_origin, _origin vectorAdd (_direction vectorMultiply 5000), _ignoreObject, objNull, true, 1, "FIRE", "VIEW", true];
if (_intersections isNotEqualTo []) then {
    (_intersections#0) params ["_intersectPos", "", "_object"];

    if (_designateInput == 1) then {
        _seekerTargetPos = _intersectPos;
    };

    _nearObjects = (ASLtoAGL _seekerTargetPos) nearObjects ["AllVehicles", CHECK_DISTANCE];

    if (_designateInput == 1 && { !isNull _object } && { _object isKindOf "Building" }) then {
        _nearObjects pushBack _object;
        if (isNull _desiredObject) then {
            _desiredObject = _object;
        };
    };
};

if (_nearObjects isNotEqualTo []) then {
    // I want to prefer the designated position on the object moreso than the bounds of the object
    private _averagePosition = _seekerTargetPos vectorMultiply SEEKER_BIAS;
    private _averagePositionCounter = SEEKER_BIAS;
    
    private _bestScore = 0;
    private _bestObject = objNull;

    {
        private _tiMagnitude = (vectorMagnitude getVehicleTIPars _x) / 1.74; // 1.74 = sqrt(3) = max magnitude of [1, 1, 1]
        private _distance = (getPosASLVisual _x) vectorDistanceSqr _seekerTargetPos;

        private _score = 4 * _tiMagnitude + (_distance / (CHECK_DISTANCE * CHECK_DISTANCE));
        if (_desiredObject isEqualTo _x) then {
            _score = _score * 2;
        };
        if (_score > _bestScore) then {
            _bestScore = _score;
            _bestObject = _x;
        };
    } forEach _nearObjects;

    private _boundingBox = 0 boundingBoxReal _bestObject;

    // Project target bounding box onto screen and do a real bad edge detection check
    _boundingBox params ["_min", "_max"];
    _min params ["_x0", "_y0", "_z0"];
    _max params ["_x1", "_y1", "_z1"];

    private _utl = _bestObject modelToWorldVisualWorld [_x0, _y0, _z0];
    private _utr = _bestObject modelToWorldVisualWorld [_x1, _y0, _z0];
    private _ubr = _bestObject modelToWorldVisualWorld [_x1, _y1, _z0];
    private _ubl = _bestObject modelToWorldVisualWorld [_x0, _y1, _z0];

    private _dtl = _bestObject modelToWorldVisualWorld [_x0, _y0, _z1];
    private _dtr = _bestObject modelToWorldVisualWorld [_x1, _y0, _z1];
    private _dbr = _bestObject modelToWorldVisualWorld [_x1, _y1, _z1];
    private _dbl = _bestObject modelToWorldVisualWorld [_x0, _y1, _z1];

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

