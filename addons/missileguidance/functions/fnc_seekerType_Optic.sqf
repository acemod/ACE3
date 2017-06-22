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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["", "_args"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "_stateParams"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["", "_targetParams"];
_targetParams params ["_target"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange"];

if (isNil "_target") exitWith {[0,0,0]};

private _foundTargetPos = aimPos _target;

// @TODO: This is seeker LOS and angle checks for LOAL only; LOBL does not need visual
private _angleOkay = [_projectile, _foundTargetPos, _seekerAngle] call FUNC(checkSeekerAngle);

private _losOkay = false;
if (_angleOkay) then {
    _losOkay = [_projectile, _target] call FUNC(checkLos);
};
TRACE_2("", _angleOkay, _losOkay);

// Can't see target, return [0,0,0] and let doSeekerSearch handle it
if (!_angleOkay || !_losOkay) exitWith {[0,0,0]};

TRACE_2("", _target, _foundTargetPos);
// @TODO: Configurable lead for seekers
private _projectileSpeed = (vectorMagnitude velocity _projectile);
private _distanceToTarget = (getPosASL _projectile) vectorDistance _foundTargetPos;
private _eta = _distanceToTarget / _projectileSpeed;

private _adjustDistance = (velocity _target) vectorMultiply _eta;
TRACE_3("leading target",_distanceToTarget,_eta,_adjustDistance);
_foundTargetPos = _foundTargetPos vectorAdd _adjustDistance;

TRACE_2("return",_foundTargetPos,(aimPos _target) distance _foundTargetPos);
_foundTargetPos;
