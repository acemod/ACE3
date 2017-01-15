/*
 * Author: jaynus / nou
 * Attack profile: Javelin Top
 *
 * Arguments:
 * 0: Seeker Target PosASL <ARRAY>
 * 1: Guidance Arg Array <ARRAY>
 * 2: Attack Profile State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_JAV_TOP;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

#define STAGE_LAUNCH 1
#define STAGE_CLIMB 2
#define STAGE_COAST 3
#define STAGE_TERMINAL 4

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

if (_attackProfileStateParams isEqualTo []) then {
    _attackProfileStateParams set [0, STAGE_LAUNCH];
};

private _shooterPos = getPosASL _shooter;
private _projectilePos = getPosASL _projectile;

private _distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;
private _distanceToShooter = _projectilePos vectorDistance _shooterPos;
private _distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

TRACE_2("", _distanceToTarget, _distanceToShooter);

// Add height depending on distance for compensate
private _returnTargetPos = _seekerTargetPos;

switch( (_attackProfileStateParams select 0) ) do {
    case STAGE_LAUNCH: {
        TRACE_1("STAGE_LAUNCH","");
        if (_distanceToShooter < 10) then {
            _returnTargetPos = _seekerTargetPos vectorAdd [0,0,_distanceToTarget*2];
        } else {
            _attackProfileStateParams set [0, STAGE_CLIMB];
        };
    };
    case STAGE_CLIMB: {
        TRACE_1("STAGE_CLIMB","");
        private _cruisAlt = 140;
        if (_distanceShooterToTarget < 1250) then {
            _cruisAlt = 140 * (_distanceShooterToTarget/1250);
            TRACE_1("_cruisAlt", _cruisAlt);
        };
        if ( ((ASLToAGL _projectilePos) select 2) - ((ASLToAGL _seekerTargetPos) select 2) >= _cruisAlt) then {
            if (_cruisAlt < 140) then {
                _attackProfileStateParams set [0, STAGE_TERMINAL];
            } else {
                _attackProfileStateParams set [0, STAGE_COAST];
            };
        } else {
             _returnTargetPos = _seekerTargetPos vectorAdd [0,0,_distanceToTarget*1.5];
        };
    };
    case STAGE_COAST: {
        TRACE_1("STAGE_COAST","");
        TRACE_1("", ((ASLToAGL _projectilePos) select 2) - (( ASLToAGL _seekerTargetPos) select 2) );
        if (_distanceToTarget < ( ((ASLToAGL _projectilePos) select 2) - (( ASLToAGL _seekerTargetPos) select 2) ) * 2) then {
            _attackProfileStateParams set [0, STAGE_TERMINAL];
        } else {
            _returnTargetPos = _seekerTargetPos vectorAdd [0,0,(_projectilePos select 2)];
        };
    };
    case STAGE_TERMINAL: {
        TRACE_1("STAGE_TERMINAL","");
        //_returnTargetPos = _seekerTargetPos vectorAdd [0,0,_distanceToTarget * 0.02];
        _returnTargetPos = _seekerTargetPos;
    };
};

TRACE_1("Adjusted target position", _returnTargetPos);
_returnTargetPos;
