/*
 * Author: PabstMirror
 * Handles the magnetic seeker for the top-down attack
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
_launchParams params ["", "_targetParams", "", "_attackProfile"];
_targetLaunchParams params ["", "", "_launchPos"];

if (_attackProfile == QGVAR(directAttack)) exitWith {[0,0,0]};

private _projPos = getPosASL _projectile;

if ((_projPos distance _launchPos) > 25) then {
    scopeName "targetScan";
    if (_seekerStateParams isEqualTo []) then {
        _seekerStateParams set [0, _projPos];
        _seekerStateParams set [1, false];
    };
    _seekerStateParams params ["_lastPos", "_terminal"];
    if (_terminal) exitWith {};
    private _vectorDir = _lastPos vectorFromTo _projPos;
    private _distance = _lastPos vectorDistance _projPos;

    for "_stepSize" from 0 to _distance step 0.5 do {
        private _virtualPos = _lastPos vectorAdd (_vectorDir vectorMultiply _stepSize);
        #ifdef DRAW_NLAW_INFO
        drawLine3D [ASLtoAGL _virtualPos, ASLtoAGL (_virtualPos vectorAdd [0,0,-5]), [1,0,_stepSize/(_distance max 0.1),1]];
        #endif

        private _res = lineIntersectsSurfaces [_virtualPos, (_virtualPos vectorAdd [0,0,-10]), _projectile];
        if (!(_res isEqualTo [])) then {
            (_res select 0) params ["_targetPos", "", "_target"];
            #ifdef DRAW_NLAW_INFO
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLtoAGL _targetPos, 0.75, 0.75, 0, typeOf _target, 1, 0.025, "TahomaB"];
            #endif
            if ((_target isKindOf "Tank") || {_target isKindOf "Car"} || {_target isKindOf "Air"}) exitWith {
                TRACE_1("firing shaped charge down",_target);
                _virtualPos = _virtualPos vectorAdd (_vectorDir vectorMultiply 0.5);
                _seekerStateParams set [1, true];
                _projPos = _virtualPos;
                _projectile setPosASL _virtualPos;

                // Missile fires shaped charge straight down...
                // This just takes the existing projectile and re-aims it to shoot it straight down
                // Should it be a different projectile with increased penetation and decrease the hit on the normal one?

                _projectile setVectorDirAndUp [[0,0,-1], [1,0,0]];
                _projectile setVelocity ([0,0,-1] vectorMultiply (vectorMagnitude (velocity _projectile)));
                breakOut "targetScan";
            };
        };
    };
    _seekerStateParams set [0, _projPos];
};

// Terminal - going almost straight down (missile guidance doesn't like [0,0,-1])
if (_seekerStateParams param [1, false]) exitWith {
    _projPos vectorAdd [0,0.01,-10];
};

// return:
[0,0,0]
