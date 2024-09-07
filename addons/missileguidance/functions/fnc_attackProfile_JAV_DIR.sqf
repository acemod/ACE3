#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Attack profile: Javelin Dir
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_JAV_DIR;
 *
 * Public: No
 */

#define STAGE_LAUNCH 1
#define STAGE_CLIMB 2
#define STAGE_COAST 3
#define STAGE_TERMINAL 4

#define CLIMB_ANGLE 12
#define ATTACK_ANGLE 2

params ["_seekerTargetPos", "_args", "_attackProfileStateParams"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

if (_attackProfileStateParams isEqualTo []) then {
    _attackProfileStateParams set [0, STAGE_LAUNCH];
    _attackProfileStateParams set [1, 0];
};

private _shooterPos = getPosASL _shooter;
private _projectilePos = getPosASL _projectile;

private _distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;
private _distanceToShooter = _projectilePos vectorDistance _shooterPos;
private _distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

TRACE_2("",_distanceToTarget,_distanceToShooter);

// Add height depending on distance for compensate
private _returnTargetPos = _seekerTargetPos;

private _attackDirection = _seekerTargetPos vectorDiff _projectilePos;
private _horizon = velocity _projectile;
_horizon set [2, 0];
_horizon = vectorNormalized _horizon;
private _attackAngle = acos (_horizon vectorCos _attackDirection);

switch (_attackProfileStateParams select 0) do {
    case STAGE_LAUNCH: {
        TRACE_1("STAGE_LAUNCH","");
        if (_distanceToShooter < 6) then {
            _returnTargetPos = _seekerTargetPos vectorAdd [0,0,5];
        } else {
            _attackProfileStateParams set [0, STAGE_CLIMB];
        };
    };
    case STAGE_CLIMB: {
        TRACE_1("STAGE_CLIMB","");
        if (_attackAngle >= ATTACK_ANGLE) then {
            _attackProfileStateParams set [0, STAGE_TERMINAL];
        } else {
            private _height = _distanceShooterToTarget * tan CLIMB_ANGLE;
            _returnTargetPos = _seekerTargetPos vectorAdd [0,0,_height];
        };
    };
    case STAGE_TERMINAL: {
        TRACE_1("STAGE_TERMINAL","");
        _returnTargetPos = _seekerTargetPos;
    };
};

_attackProfileStateParams set [2, _returnTargetPos];

TRACE_1("Adjusted target position",_returnTargetPos);
_returnTargetPos;
