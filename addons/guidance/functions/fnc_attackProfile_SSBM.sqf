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

params ["_projectile", "_shooter","_extractedInfo", "_seekerTargetPos"];
_extractedInfo params ["_seekerType","_attackProfile","_target","_targetPos","_targetVector","_launchPos", "_miscSeeker", "_miscProfile"];
_miscProfile params ["_thrust", "_thrustTime", "_launchTime"];

_projPos = getPosASL _projectile;

//parabolic form = y = (x-h)^2 + k
_k = (_projPos select 2) - (_targetPos select 2);



_speed = vectorMagnitude (velocity _projectile));
_timeLeft = ((_thrustTime - (time - _launchTime)) min 0);
_finalSpeed = (_speed + ( _timeLeft * _thrust );




_finalDistance = (_timeLeft * _speed) + (_thrust * (_timeLeft)^2)/2;

_finalPos = _projPos + ((vectorNormalized (velocity _projectile)) * _finalDistance);




_seekerTargetPos;
