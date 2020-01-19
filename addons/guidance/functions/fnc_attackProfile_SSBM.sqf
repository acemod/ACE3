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

_miscProfile params ["_distanceToTarget", "_pastMidpoint"];

_projPos = getPosASL _projectile;

if((time - _launchTime) < 20) exitWith {
(getPosASL _projectile) vectorAdd [0,0,10];
};

if(isNil "_distanceToTarget") then {
    _distanceToTarget = sqrt(  ((_projPos select 0) - (_seekerTargetPos select 0))^2 + ((_projPos select 1) - (_seekerTargetPos select 1))^2);
    _miscProfile set [0, _distanceToTarget];
};
if(isNil "_pastMidpoint") then {
    _pastMidpoint = false;
    _miscProfile set [1, _pastMidpoint];
};

_dirToTarget = ((_seekerTargetPos select 0) - (_projPos select 0)) atan2 ((_seekerTargetPos select 1) - (_projPos select 1));

if( (sqrt(((_projPos select 0) - (_seekerTargetPos select 0))^2 + ((_projPos select 1) - (_seekerTargetPos select 1))^2)) < (_distanceToTarget/2) ) then {
    _miscProfile set [1, true];
};

if(!(_pastMidpoint)) exitWith {
    (getPosASL _projectile) vectorAdd [sin(_dirToTarget)*cos(45),cos(_dirToTarget)*cos(45),sin(45)];
};

_seekerTargetPos;