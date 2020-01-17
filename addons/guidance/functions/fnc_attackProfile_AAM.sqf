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
_miscManeuvering params ["_degreesPerSecond","_lastTickTime", "_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];

_miscProfile params ["_lastTargetVector"]; // world vector

private _projPos = getPosASL _projectile;
if (time - _launchTime < 0.75) exitWith {[0,0,0]};

if(_seekerTargetPos isEqualTo [0,0,0]) exitWith {
    [0,0,0];
    _miscProfile set [0,[0,0,0]];
};

if(_lastTargetVector isEqualTo [0,0,0]) exitWith {
    _lastTargetVector = _projPos vectorFromTo _seekerTargetPos;
    _miscProfile set [0,_lastTargetVector];
    _extractedInfo set [4, _lastTargetVector];
};

private _toTargetVector = _projPos vectorFromTo _seekerTargetPos;
private _angleDif = acos(_attackTrajectory vectorCos _seekerTargetRelPos);


private _vector = _toTargetVector;

/*
if(_angleDif > 0) then {
    private _crossVector = _lastTargetVector vectorCrossProduct _toTargetVector;
    _vector = [_vector, _crossVector, -_angleDif] call CBA_fnc_vectRotate3D;
};
*/

_extractedInfo set [4, _toTargetVector];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.8,0,1], ASLToAGL (_projPos vectorAdd (_vector vectorMultiply (_projPos distance _seekerTargetPos))), 0.75, 0.75, 0, "Trajectory", 1, 0.025, "TahomaB"];
drawLine3D [(ASLtoAGL _projPos), ASLToAGL (_projPos vectorAdd (_vector vectorMultiply 10)), [1,0.8,0,1]];

//hint format ["%1", _vector];
_projPos vectorAdd _vector;
//_seekerTargetPos;
