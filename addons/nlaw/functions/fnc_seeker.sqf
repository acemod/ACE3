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
#define STEP_SIZE 0.25
params ["", "_args", "_seekerStateParams", "", "", "_targetData"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["", "_targetLaunchParams", "", "_attackProfile"];
_targetLaunchParams params ["", "", "_launchPos"];
_stateParams params ["", "", "", "", "_navigationParams"];

if (_attackProfile == QGVAR(directAttack)) exitWith {
    [0, 0, 0]
};

_seekerStateParams params ["", "", "", "_originalPitchRate", "_startTime"];

private _projPos = getPosASL _projectile;

// Arm seeker after 20 meters
if ((_projPos distance _launchPos) >= 20) then {
    scopeName "targetScan";
    BEGIN_COUNTER(targetScan);

    if (_seekerStateParams isEqualTo []) then {
        TRACE_2("Seeker Armed",_projPos distance _launchPos,diag_fps);
        _seekerStateParams set [0, _projPos]; // Set _lastPos to current position
    };

    _seekerStateParams params ["_lastPos", "_state"];

    private _vectorDir = _lastPos vectorFromTo _projPos;
    private _frameDistance = _lastPos vectorDistance _projPos;

    private _speed = vectorMagnitude velocity _projectile;
    private _virtualTimeStep = STEP_SIZE / _speed;

    // Distance traveled depends on velocity and FPS - at 60fps it will be ~4m
    // Step size will effect accuracy and performance costs
    for "_stepSize" from 0 to _frameDistance step STEP_SIZE do {
        // This represents a position that the missile was at between the last frame and now
        private _virtualPos = _lastPos vectorAdd (_vectorDir vectorMultiply _stepSize);
        #ifdef DRAW_NLAW_INFO
        drawLine3D [ASLToAGL _virtualPos, ASLToAGL (_virtualPos vectorAdd [0,0,-5]), [1,0,_stepSize/(_frameDistance max 0.1),1]];
        #endif

        if (_state == SEEKER_STATE_TERMINAL) then {
            _seekerStateParams params ["", "", "", "", "", "_fuzeTime"];
            if (_frameDistance - _stepSize < STEP_SIZE) then {
                _fuzeTime = _fuzeTime - abs (_frameDistance - _stepSize) / _speed;
            } else {
                _fuzeTime = _fuzeTime - _virtualTimeStep;
            };
            systemChat str [_stepSize, _fuzeTime];
            _seekerStateParams set [5, _fuzeTime];
            if (_fuzeTime <= 0) then {
                _seekerStateParams set [1, SEEKER_STATE_DETONATED];
                _state = SEEKER_STATE_DETONATED;
            };
        };

        // Limit scan to 5 meters directly down (shaped charge jet has a very limited range)
        private _res = lineIntersectsSurfaces [_virtualPos, (_virtualPos vectorAdd [0,0,-5]), _projectile, objNull, true, 1, "FIRE", "VIEW"];
        if (_res isNotEqualTo []) then {
            (_res select 0) params ["_targetPos", "", "_target"];
            if ((_target isKindOf "Tank") || {_target isKindOf "Car"} || {_target isKindOf "Air"}) then {
                TRACE_3("Firing shaped charge down",_target,_targetPos distance _virtualPos,_frameDistance);
                TRACE_2("",_target worldToModel (ASLToAGL _virtualPos),boundingBoxReal _target);

                if (_state == SEEKER_STATE_LOOKING) then {
                    _seekerStateParams set [1, SEEKER_STATE_TERMINAL];
                    _state = SEEKER_STATE_TERMINAL;
                };
            };
        };

        if (_state == SEEKER_STATE_DETONATED) exitWith {
            private _projDir = vectorUp _projectile;
            _projectile setPosASL _virtualPos;
            triggerAmmo _projectile;

            private _jet = createVehicle ["ACE_NLAW_Penetrator", [0, 0, 0], [], 0, "NONE"];
            private _jetSpeed = getNumber (configOf _jet >> "typicalSpeed");
            _jet setPosASL _virtualPos;
            _jet setVelocity (_projDir vectorMultiply -_jetSpeed);

            _virtualPos = _virtualPos vectorAdd (_vectorDir vectorMultiply 1.25);

            END_COUNTER(targetScan);
            breakOut "targetScan";
        };
    };
    _seekerStateParams set [0, _projPos];
    END_COUNTER(targetScan);
};

// Exploded, return dummy value
if ((_seekerStateParams param [1, SEEKER_STATE_LOOKING]) == SEEKER_STATE_DETONATED) exitWith {
    [0,0,1]
};

// return:
[0,0,0]
