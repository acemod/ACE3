#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * TERCOM seeker. Checks change in height data to current change in height and figures out where it is
 * TERCOM works by determining the gradient of height change where the missile is, finding the most likely candidate for that in the
 * heightmap, and then plotting a course that will guide it towards the waypointed flightpath
 * If you have a lot of similar gradients, this will not work as well since it could potentially lead to loss of munition
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Expected correction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_TERCOM
 *
 * Public: No
 */
params ["", "_args", "_seekerStateParams", "", "_timestep"];
_args params ["_firedEH", "_launchParams", "", "", "", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_seekerStateParams params ["_heightBuffer", "_heightStrip", "_lastMeasurePos", "_insPosition", "_seekerState", "_currentWaypoint", "_waypoints", "_heightmap"];
_launchParams params ["", "_targetLaunchParams"];
_targetLaunchParams params ["", "", "_launchPos"];

private _finalPosition = [0, 0, 0];
switch (_seekerState) do {
    case TERCOM_STATE_SEEKING_BASKET: {
        // must have at least 2 waypoints, so this will never error
        private _waypoint1 = _waypoints select 0;
        private _waypoint2 = _waypoints select 1;
        _waypoint1 params ["_positionA", "_cruiseHeight"];
        _waypoint2 params ["_positionB"];

        private _direction = _positionA vectorFromTo _positionB;
        private _position = _positionA vectorAdd (_direction vectorMultiply (0.5 * (_positionA vectorDistance _positionB)));

        _launchPos set [2, _cruiseHeight];
        _position set [2, _cruiseHeight];

        private _desiredPathDir = _launchPos vectorFromTo _position;

        private _missilePosProjected = _launchPos vectorAdd (_desiredPathDir vectorMultiply ((_insPosition vectorDistance _launchPos) + 100));
        private _distance = _insPosition vectorDistance _missilePosProjected;

        _targetData set [2, _distance];
        _finalPosition = _missilePosProjected;

        (_heightmap select 0) params ["", "_gridSize"];
        if (_insPosition inArea [_position, _gridSize, _gridSize, (_direction#0) atan2 (_direction#1), true]) then {
            _seekerStateParams set [4, TERCOM_STATE_FOLLOWING_TERRAIN];
            _seekerStateParams set [2, _insPosition];
        };
    };
    case TERCOM_STATE_FOLLOWING_TERRAIN: {
        (_heightmap select _currentWaypoint) params ["_grid", "_gridSize", "_cellResolution", "_gridWidth", "_gridHeight"];

        // just brute force it, we won't usually have a lot of grids to check
        if (_insPosition vectorDistance _lastMeasurePos < _cellResolution) then {
            _heightBuffer pushBack getTerrainHeightASL _insPosition;
        } else {
            private _averageHeight = 0;
            {
                _averageHeight = _averageHeight + _x;
            } forEach _heightBuffer;
            _averageHeight = _averageHeight / count _heightBuffer;
            _heightStrip pushBack _averageHeight;
            
            // find all strips in heightmap that match the direction we are moving
            // Start from edge and go in
            // Match strip to what we found that best fits

            private _direction = _insPosition vectorFromTo _lastMeasurePos;

            private _possibleStrips = [];
            private _xDir = 0;
            if ((_direction select 0) < 0) then {
                _xDir = -1;
            } else {
                _xDir = 1;
            };

            private _yDir = 0;
            if ((_direction select 2) < 0) then {
                _yDir = -1;
            } else {
                _yDir = 1;
            };

            _heightBuffer = [];
            _seekerStateParams set [1, _heightStrip];
            _seekerStateParams set [2, _insPosition];
        };

        _seekerStateParams set [0, _heightBuffer];
    };
    case TERCOM_STATE_TERMINAL: {

    };
};

if (!isGamePaused && accTime > 0) then {
    private _projectileVelocity = velocity _projectile;
    _insPosition = _insPosition vectorAdd (_projectileVelocity vectorMultiply _timestep);

    _seekerStateParams set [3, _insPosition];
};

_finalPosition
