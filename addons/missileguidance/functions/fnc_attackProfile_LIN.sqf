#include "..\script_component.hpp"
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

params ["_seekerTargetPos", "_args"];
_args params ["_firedEH", "_launchParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["","_targetLaunchParams"];
_targetLaunchParams params ["", "", "_launchPos"];

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {_seekerTargetPos};

private _shooterPos = getPosASL _shooter;
private _projectilePos = getPosASL _projectile;

private _distanceToTarget = _projectilePos vectorDistance _seekerTargetPos;
private _distanceToShooter = _projectilePos vectorDistance _shooterPos;
private _distanceShooterToTarget = _shooterPos vectorDistance _seekerTargetPos;

private _ttgo = _distanceToTarget / (vectorMagnitude velocity _projectile);

TRACE_2("",_distanceToTarget,_distanceToShooter);

// Add height depending on distance for compensate
private _addHeight = [0,0,0];

private _2dDistance = (800 + (_projectilePos distance2D _launchPos)) / (_projectilePos distance2D _seekerTargetPos);

if (_2dDistance <= 1) then {
    _addHeight =  [0, 0, (_projectilePos#2) + 8];
} else {
    // Always climb an arc on initial launch if we are close to the round
    if ((((ASLToAGL _projectilePos) select 2) < 5) && {_distanceToShooter < 15}) then {
        _addHeight = _addHeight vectorAdd [0,0,_distanceToTarget];
        TRACE_1("climb - near shooter",_addHeight);
    } else {
        // If we are below the target, increase the climbing arc
        if (((_projectilePos select 2) < (_seekerTargetPos select 2)) && {_distanceToTarget > 100}) then {
            _addHeight = _addHeight vectorAdd [0,0, ((_seekerTargetPos select 2) - (_projectilePos select 2))];
            TRACE_1("climb - below target and far",_addHeight);
        };
    };
};

private _returnTargetPos = _seekerTargetPos vectorAdd _addHeight;

TRACE_2("Adjusted target position",_returnTargetPos,_addHeight);
_returnTargetPos;
