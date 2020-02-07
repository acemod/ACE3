#include "script_component.hpp"
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

params ["_projectile", "_shooter","_extractedInfo","_seekerTargetPos"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile"];
_miscManeuvering params ["_degreesPerSecond", "_glideAngle", "_lastTickTime", "_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscProfile params ["", "_lastTargetVector"]; // world vector

if (_seekerTargetPos isEqualTo [0,0,0]) exitWith {
    _miscProfile set [1, nil];
    [0,0,0];
};

private _projPos = getPosASL _projectile;
private _toTargetVector = _projPos vectorFromTo _seekerTargetPos;

if(isNil "_lastTargetVector") exitWith {
    _miscProfile set [1, _toTargetVector];
};

private _angle = acos(_toTargetVector vectorCos _lastTargetVector);
private _crossVector = _toTargetVector vectorCrossProduct _lastTargetVector;
hint str [_angle];

_vector = vectorDir _projectile;
if(_angle != 0) then {
    _vector = [_toTargetVector, _crossVector, -_angle] call CBA_fnc_vectRotate3D;
};

_extractedInfo set [4, _toTargetVector];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.8,0,1], ASLToAGL (_projPos vectorAdd (_vector vectorMultiply (_projPos distance _seekerTargetPos))), 0.75, 0.75, 0, "Trajectory", 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), ASLToAGL (_projPos vectorAdd (_vector vectorMultiply 10)), [1,0.8,0,1]];
drawLine3D [(ASLtoAGL _projPos), ASLToAGL (_projPos vectorAdd (_crossVector vectorMultiply 10)), [0,0,1,1]];

//hint format ["%1", _vector];


_projPos vectorAdd _vector;
//_seekerTargetPos;
