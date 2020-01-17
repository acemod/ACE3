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

_miscProfile params ["_attackTrajectory"];

_projPos = getPosASL _projectile;

if(isNil "_attackTrajectory") then {
    if(_seekerTargetPos isEqualTo [0,0,0]) exitWith {
        [0,0,0];
    } else {
        _attackTrajectory = vectorNormalized (_projectile worldToModel ASLToAGL (_seekerTargetPos));
        _miscProfile set [0,_attackTrajectory];
        _extractedInfo set [4, _attackTrajectory];
    };
};

_seekerTargetRelPos = vectorNormalized (_projectile worldToModel ASLToAGL (_seekerTargetPos));
_angleDif = acos(_attackTrajectory vectorDotProduct _seekerTargetRelPos);
_v = vectorDir _projectile;
if(_angleDif != 0) then {
    _crossVector = _attackTrajectory vectorCrossProduct _seekerTargetRelPos;
    _v = [vectorDir _projectile, _crossVector, _angleDif] call CBA_fnc_vectRotate3D;
};



//hint format ["%1", _attackTrajectory];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], _projectile modelToWorld (_attackTrajectory vectorMultiply (_projectile distance _seekerTargetPos)), 0.75, 0.75, 0, "Trajectory", 1, 0.025, "TahomaB"];
//AGLToASL (_projectile modelToWorld _attackTrajectory);

//_projPos vectorAdd _v;
_seekerTargetPos;
