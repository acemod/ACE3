#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the top down attack seeker for missile guidance.
 * Has a very short range (IR/Magnetic?) seeker that will trigger the shaped charge midair above the target.
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Seeker Pos <ARRAY>
 *
 * Example:
 * [] call ace_nlaw_fnc_seeker
 *
 * Public: No
 */
#define PITCH_UP_TIME 1

params ["", "_args", "_seekerStateParams", "", "", "_targetData"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["", "_targetLaunchParams", "", "_attackProfile"];
_targetLaunchParams params ["", "", "_launchPos"];
_stateParams params ["", "", "", "", "_navigationParams"];

if (_attackProfile == QGVAR(directAttack)) exitWith {
    _navigationParams set [5, 1];
    [0,0,0]
};

_seekerStateParams params ["", "", "", "_originalPitchRate", "_startTime"];
_navigationParams params ["", "_pitchRate"];

// pitch up for the first second of flight to begin an over-fly trajectory
private _pitchChange = linearConversion [0, PITCH_UP_TIME, CBA_missionTime - _startTime, 2, 0, true];
_navigationParams set [1, _originalPitchRate + _pitchChange];
_navigationParams set [5, ((CBA_missionTime - _startTime) min PITCH_UP_TIME) / PITCH_UP_TIME];

private _projPos = getPosASL _projectile;

// Arm seeker after 20 meters
if ((_projPos distance _launchPos) >= 20) then {
    scopeName "targetScan";
    BEGIN_COUNTER(targetScan);

    if (_seekerStateParams isEqualTo []) then {
        TRACE_2("Seeker Armed",_projPos distance _launchPos,diag_fps);
        _seekerStateParams set [0, _projPos]; // Set _lastPos to current position
    };

    _seekerStateParams params ["_lastPos", "_terminal"];
    if (_terminal) exitWith {};

    private _vectorDir = _lastPos vectorFromTo _projPos;
    private _frameDistance = _lastPos vectorDistance _projPos;

    // Distance traveled depends on velocity and FPS - at 60fps it will be ~4m
    // Step size will effect accuracy and performance costs
    for "_stepSize" from 0 to _frameDistance step 0.5 do {
        // This represents a position that the missile was at between the last frame and now
        private _virtualPos = _lastPos vectorAdd (_vectorDir vectorMultiply _stepSize);
        #ifdef DRAW_NLAW_INFO
        drawLine3D [ASLToAGL _virtualPos, ASLToAGL (_virtualPos vectorAdd [0,0,-5]), [1,0,_stepSize/(_frameDistance max 0.1),1]];
        #endif

        // Limit scan to 5 meters directly down (shaped charge jet has a very limited range)
        private _res = lineIntersectsSurfaces [_virtualPos, (_virtualPos vectorAdd [0,0,-5]), _projectile, objNull, true, 1, "FIRE", "VIEW"];
        if (_res isNotEqualTo []) then {
            (_res select 0) params ["_targetPos", "", "_target"];
            if ((_target isKindOf "Tank") || {_target isKindOf "Car"} || {_target isKindOf "Air"}) exitWith {
                TRACE_3("Firing shaped charge down",_target,_targetPos distance _virtualPos,_frameDistance);
                TRACE_2("",_target worldToModel (ASLToAGL _virtualPos),boundingBoxReal _target);
                _virtualPos = _virtualPos vectorAdd (_vectorDir vectorMultiply 1.25);

                _projectile setMissileTarget [_target, true];
                triggerAmmo _projectile;

                _seekerStateParams set [1, true];

                END_COUNTER(targetScan);
                breakOut "targetScan";
            };
        };
    };
    _seekerStateParams set [0, _projPos];
    END_COUNTER(targetScan);
};

// Exploded, return dummy value
if (_seekerStateParams param [1, false]) exitWith {
    [0,0,1]
};

// return:
[0,0,0]
