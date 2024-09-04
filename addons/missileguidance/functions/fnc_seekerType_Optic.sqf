#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_Optic;
 *
 * Public: No
 */

params ["", "_args"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["", "_targetParams"];
_targetParams params ["_target"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];

if (isNil "_target") exitWith {[0,0,0]};

private _foundTargetPos = _target modelToWorldVisualWorld getCenterOfMass _target;

// @TODO: This is seeker LOS and angle checks for LOAL only; LOBL does not need visual
private _angleOkay = [_projectile, _foundTargetPos, _seekerAngle] call FUNC(checkSeekerAngle);

private _losOkay = false;
if (_angleOkay) then {
    _losOkay = [_projectile, _target] call FUNC(checkLos);
};
TRACE_2("",_angleOkay,_losOkay);

// Can't see target, return [0,0,0] and let doSeekerSearch handle it
if (!_angleOkay || !_losOkay) exitWith {[0,0,0]};

TRACE_2("",_target,_foundTargetPos);
private _distanceToTarget = (getPosASL _projectile) vectorDistance _foundTargetPos;

_targetData set [0, (getPosASL _projectile) vectorFromTo _foundTargetPos];
_targetData set [2, _distanceToTarget];
_targetData set [3, velocity _target];

TRACE_2("return",_foundTargetPos,(aimPos _target) distance _foundTargetPos);
_foundTargetPos;
