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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["", "_args", "_seekerStateParams"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["", "_targetLaunchParams", "", "_attackProfile"];
_targetLaunchParams params ["", "", "_launchPos"];

if (_attackProfile == QGVAR(directAttack)) exitWith {[0,0,0]};

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
        drawLine3D [ASLtoAGL _virtualPos, ASLtoAGL (_virtualPos vectorAdd [0,0,-5]), [1,0,_stepSize/(_frameDistance max 0.1),1]];
        #endif

        // Limit scan to 5 meters directly down (shaped charge jet has a very limited range)
        private _res = lineIntersectsSurfaces [_virtualPos, (_virtualPos vectorAdd [0,0,-5]), _projectile];
        if (!(_res isEqualTo [])) then {
            (_res select 0) params ["_targetPos", "", "_target"];
            if ((_target isKindOf "Tank") || {_target isKindOf "Car"} || {_target isKindOf "Air"}) exitWith {
                TRACE_3("Firing shaped charge down",_target,_targetPos distance _virtualPos,_frameDistance);
                TRACE_2("",_target worldToModel (ASLtoAGL _virtualPos),boundingBoxReal _target);
                _virtualPos = _virtualPos vectorAdd (_vectorDir vectorMultiply 1.25);

                deleteVehicle _projectile;

                // Damage and effects of missile exploding (timeToLive is 0 so should happen next frame)
                private _explosion = "ACE_NLAW_Explosion" createVehicle _virtualPos;
                _explosion setPosASL _virtualPos;

                // Just damage from shaped charge
                private _shapedCharage = "ACE_NLAW_ShapedCharge" createVehicle _virtualPos;
                _shapedCharage setPosASL _virtualPos;
                _shapedCharage setVectorDirAndUp [[0,0,-1], [1,0,0]];
                _shapedCharage setVelocity [0,0,-300];

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
