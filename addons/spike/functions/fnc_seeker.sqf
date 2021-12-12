#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Seeker Type: Spike Optical
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_spike_fnc_seeker;
 *
 * Public: No
 */

params ["", "_args", "_seekerStateParams", "", "_timestep"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["", "_targetParams"];
_targetParams params ["_target"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];

private _cameraNamespace = [_projectile] call FUNC(camera_getCameraNamespaceFromProjectile);
private _seekerTargetPos = _cameraNamespace getVariable [QGVAR(seekerTargetPos), [0, 0, 0]];
private _cameraPos = _cameraNamespace getVariable [QGVAR(cameraPos), [0, 0, 0]];
private _logicPos = _cameraNamespace getVariable [QGVAR(logicPos), [0, 0, 0]];

private _seekerTargetInfo = _cameraNamespace getVariable [QGVAR(seekerTargetInfo), [false, [0, 0, 0], [0, 0, 0]]];

private _intersectObject = objNull;
private _designateInput = (_cameraNamespace getVariable [QGVAR(designateInput), [0]]) select 0;

if ((_seekerTargetPos isNotEqualTo [0, 0, 0]) || { (_designateInput == 1) }) then {
    private _nearObjects = [];

    private _intersections = lineIntersectsSurfaces [_cameraPos, _cameraPos vectorAdd ((vectorNormalized _logicPos) vectorMultiply 5000), objNull, objNull, true, 1, "FIRE", "VIEW", true];
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
            private _intersections = lineIntersectsSurfaces [_cameraPos, _x, objNull, objNull, false, 16];
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
    };
};

_cameraNamespace setVariable [QGVAR(seekerTargetPos), _seekerTargetPos];
_cameraNamespace setVariable [QGVAR(seekerTargetInfo), _seekerTargetInfo];

private _velocity = [0, 0, 0];
_seekerStateParams params [["_lastPositions", []], ["_lastAveragePosition", [0, 0, 0]]];
if (5 < count _lastPositions) then {
    private _averagePosition = [0, 0, 0];
    {
        _averagePosition = _averagePosition vectorAdd _x;
    } forEach _lastPositions;

    _averagePosition = _averagePosition vectorMultiply (1 / count _lastPositions);

    if (_lastAveragePosition isNotEqualTo [0, 0, 0]) then {
        if (_timestep == 0) then {
            _velocity = [0, 0, 0];
        } else {
            _velocity = (_averagePosition vectorDiff _lastAveragePosition) vectorMultiply (1 / _timestep);
        }
    };
    _seekerStateParams set [1, _averagePosition];
    _lastPositions = [];
};

_targetData set [0, (getPosASLVisual _projectile) vectorFromTo _seekerTargetPos];
_targetData set [2, (getPosASLVisual _projectile) vectorDistance _seekerTargetPos];
_targetData set [3, _velocity];

_lastPositions pushBack _seekerTargetPos;
_seekerStateParams set [0, _lastPositions];

_seekerTargetPos

