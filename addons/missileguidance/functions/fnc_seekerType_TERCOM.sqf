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
_seekerStateParams params ["_heightBuffer", "_insPosition", "_seekerState", "_currentWaypoint", "_waypoints", "_heightmap"];
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

        (_heightmap select 0) params ["", "_resolution"];
        if (_insPosition inArea [_position, _resolution, _resolution, (_direction#0) atan2 (_direction#1), true]) then {
            _seekerStateParams set [2, TERCOM_STATE_FOLLOWING_TERRAIN];
        };
    };
    case TERCOM_STATE_FOLLOWING_TERRAIN: {
        // just brute force it, we won't usually have a lot of grids to check
    };
    case TERCOM_STATE_TERMINAL: {

    };
};

if (!isGamePaused && accTime > 0) then {
    private _projectileVelocity = velocity _projectile;
    _insPosition = _insPosition vectorAdd (_projectileVelocity vectorMultiply _timestep);

    _seekerStateParams set [1, _insPosition];
};

_finalPosition
