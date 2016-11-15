/*
 * Author: jaynus / nou
 * Attack profile: Linear (used by DAGR)
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
 * [[1,2,3], [], []] call ace_missileguidance_fnc_attackProfile_LIN;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_seekerTargetPos", "_args"];
_args params ["_firedEH"];
_firedEH params ["_shooter","","","","","","_projectile"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

private _shooterPos = getPosASL _shooter;
private _projectilePos = getPosASL _projectile;

private _distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;
private _distanceToShooter = _projectilePos vectorDistance _shooterPos;
private _distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

TRACE_2("", _distanceToTarget, _distanceToShooter);

// Add height depending on distance for compensate
private _addHeight = [0,0,0];

// Always climb an arc on initial launch if we are close to the round
if ((((ASLtoAGL _projectilePos) select 2) < 5) && {_distanceToShooter < 15}) then {
    _addHeight = _addHeight vectorAdd [0,0,_distanceToTarget];
    TRACE_1("climb - near shooter",_addHeight);
} else {
    // If we are below the target, increase the climbing arc
    if (((_projectilePos select 2) < (_seekerTargetPos select 2)) && {_distanceToTarget > 100}) then {
        _addHeight = _addHeight vectorAdd [0,0, ((_seekerTargetPos select 2) - (_projectilePos select 2))];
        TRACE_1("climb - below target and far",_addHeight);
    };
};

// Handle arcing terminal low for high decent (when projectile above target)
if ((_projectilePos select 2) > (_seekerTargetPos select 2)) then {
    if (_distanceToTarget < 100) then {
        _addHeight = _addHeight vectorDiff [0,0, ((_projectilePos select 2) - (_seekerTargetPos select 2)) * 0.5];
        TRACE_1("above - close",_addHeight);
    } else {
        TRACE_1("above - far",_addHeight);
        _addHeight = _addHeight vectorAdd [0,0, _distanceToTarget*0.02];
    };
};

private _returnTargetPos = _seekerTargetPos vectorAdd _addHeight;

TRACE_2("Adjusted target position",_returnTargetPos,_addHeight);
_returnTargetPos;
