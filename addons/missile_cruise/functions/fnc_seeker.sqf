#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Infrared seeker. Checks if flares are popped
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_IR
 *
 * Public: No
 */
//IGNORE_PRIVATE_WARNING ["_args"]; // from doSeekerSearch
_args params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["_shooter","","","","_ammo","","_projectile"];
_launchParams params ["_shooter","_targetLaunchParams","_seekerType","_attackProfile","_lockMode","_laserInfo","_navigationType"];
_targetLaunchParams params ["_target", "", "_launchPos", "_launchDir", "_launchTime"];
_flightParams params ["_pitchRate", "_yawRate", "_isBangBangGuidance"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState","_navigationParams", "_guidanceParameters"];
_seekerParams params ["_seekerAngle", "_seekerAccuracy", "_seekerMaxRange", "_seekerMinRange"];
_targetData params ["_targetDirection", "_attackProfileDirection", "_targetRange", "_targetVelocity", "_targetAcceleration"];

_seekerStateParams params ["_lastUpdate", "_lastPosition", "_lastVelocity", "_waypoints", "_state", "_contour", "_intervalStrip", "_scanStart", "_terrainProfiles", "_scanEntryPoint"];

private _dt = CBA_missionTime - _lastUpdate;
_dt = _dt + (([0, CLOCK_INACCURACY] call EFUNC(common,normalRandom)) select 0);
private _estimatedPosition = _lastPosition vectorAdd (_lastVelocity vectorMultiply _dt);

_seekerStateParams set [0, CBA_missionTime];
_seekerStateParams set [1, _estimatedPosition];
_seekerStateParams set [2, velocity _projectile];

private _waypointPosition = [0, 0, 0];

private _nextWaypoint = _waypoints select 0;
private _nextPosition = _nextWaypoint select 1;

_nextWaypoint params ["_kind", "_targetPosition"];

_waypointPosition = _targetPosition;
switch (_state) do {
    case SEEKER_STATE_LAUNCH: {
        if ((_lastPosition distance2D _waypointPosition) < WAYPOINT_COMPLETION_RADIUS) then {
            _waypoints = _waypoints select [1, count _waypoints];
            _seekerStateParams set [3, _waypoints];
            _seekerStateParams set [4, SEEKER_STATE_FLIGHT];
            _seekerStateParams set [5, _estimatedPosition];
        };
    };
    case SEEKER_STATE_FLIGHT: {
        if ((_lastPosition distance2D _waypointPosition) < WAYPOINT_COMPLETION_RADIUS) then {
            if (_kind isEqualTo "GPS") then {
                private _error = [0, GPS_INACCURACY] call EFUNC(common,normalRandom);
                _error pushBack 0;

                _estimatedPosition = _error vectorAdd getPosASLVisual _projectile;
                _seekerStateParams set [1, _estimatedPosition];
            };
            if (_kind isEqualTo "SCAN") then {
                _seekerStateParams set [4, SEEKER_STATE_SCAN];
                _seekerStateParams set [5, []];
                _seekerStateParams set [6, []];
                _seekerStateParams set [7, _estimatedPosition];
                _seekerStateParams set [9, _estimatedPosition];
            } else {
                _waypoints = _waypoints select [1, count _waypoints];
                _seekerStateParams set [3, _waypoints];
            }
        };
    };
    case SEEKER_STATE_SCAN: {
        private _scanDistance = _estimatedPosition distance2D _scanStart;
        if (_scanDistance > TERCOM_PRECISION) then {
            _seekerStateParams set [7, _estimatedPosition];
            private _average = 0;
            {
                _average = _average + _x;
            } forEach _intervalStrip;
            _contour pushBack (_average / count _intervalStrip);
            _seekerStateParams set [5, _contour];
        } else {
            private _forward = vectorNormalized velocity _projectile;
            private _down = [0, 0, -1000];

            private _realPos = getPosASLVisual _projectile;

            private _raycasts = [
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (1.0 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (0.8 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (0.6 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (0.4 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (0.2 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (0.0 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (-0.2 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (-0.4 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (-0.6 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (-0.8 * pi)] call CBA_fnc_vectRotate3D)],
                [_realPos, _realPos vectorAdd ([_down, _forward, _seekerAngle * cos (-1.0 * pi)] call CBA_fnc_vectRotate3D)]
            ];

            private _results = lineIntersectsSurfaces [_raycasts];
            _results = _results apply {
                _x select 0
            } select {
                _x params ["_intersectPos"];
                (_intersectPos distance2d _realPos) <= (TERCOM_PRECISION / 2)
            } apply {
                _x params ["_result"];
                (_realPos vectorDiff _result) select 2
            };
            _results pushBack ((getPos _projectile) select 2);

            {
                _intervalStrip pushBack ((_estimatedPosition select 2) - _x);
            } forEach _results;
            _seekerStateParams set [6, _intervalStrip];
        };

        _waypointPosition = _nextWaypoint select 2;
        if ((_lastPosition distance2D _waypointPosition) < (WAYPOINT_COMPLETION_RADIUS / 10)) then {
            _waypoints = _waypoints select [1, count _waypoints];
            _seekerStateParams set [3, _waypoints];
            _seekerStateParams set [4, SEEKER_STATE_FLIGHT];

            (_terrainProfiles select 0) params ["_terrain", "", "_corner"];
            _corner params ["_cornerPosition", "_direction", "_directionNormal"];

            // We cross correlate the recorded strip with pre-recorded terrain contour maps
            // We should get a correlation that lets us find the best offset for the terrain profile. This will let us
            // set our position to an accuracy [-TERCOM_PRECISION / 2, TERCOM_PRECISION * 2]
            private _contourLength = count _contour;
            private _bestSum = 0;
            private _bestOffset = [0, 0];
            {
                private _reference = _x;
                for "_i" from 0 to ((count _reference) + _contourLength - 2) do {
                    private _offset = 0;
                    if (_i >= _contourLength) then {
                        _offset = 1 + _i - _contourLength;
                    };
                    private _sum = 0;
                    for "_y" from _offset to (_i min (count _reference - 1)) do {
                        private _0 = _reference select _y;
                        private _1 = _contour select (_contourLength - (_i - _y) - 1);
                        _sum = _sum + (_0 * _1);
                    };
                    if (_sum > _bestSum) then {
                        _bestSum = _sum;
                        _bestOffset = [_forEachIndex, 2 + _contourLength - (_i - _offset)];
                    };
                };
            } forEach _terrain;

            private _offsetForward = _direction vectorMultiply (TERCOM_PRECISION * (_bestOffset select 1));
            private _offsetRight = _directionNormal vectorMultiply (TERCOM_PRECISION * (_bestOffset select 0));
            private _expectedEntryPoint = _cornerPosition vectorAdd _offsetForward vectorAdd _offsetRight;

            private _error = _expectedEntryPoint vectorDiff _scanEntryPoint;

            _seekerStateParams set [5, _contour];
            _seekerStateParams set [8, _terrainProfiles select [1, count _terrainProfiles]];
            _seekerStateParams set [1, _estimatedPosition vectorAdd _error];
        };
    };
};

if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
    #ifdef DEBUG_DRAW_CONTOURS
    {
        _x params ["_terrain", "_offsets"];
        {
            private _stripOffset = _offsets select _forEachIndex;
            private _xOffset = _forEachIndex;
            {
                private _offset = _stripOffset select _forEachIndex;
                drawIcon3D [
                    "\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa",
                    [0,1,0,1],
                    ASLtoAGL _offset,
                    0.75,
                    0.75,
                    0,
                    format ["Contour: %1m", _x],
                    1,
                    0.025,
                    "TahomaB"
                ];
                drawIcon3D [
                    "\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa",
                    [1,0,0,1],
                    ASLtoAGL (_offset vectorAdd [0, 0, 10]),
                    0.75,
                    0.75,
                    0,
                    format ["Offset: [%1, %2]", _xOffset, _forEachIndex],
                    1,
                    0.025,
                    "TahomaB"
                ];
            } forEach _x;
        } forEach _terrain;
    } forEach _terrainProfiles;
    #endif
};

_waypointPosition
