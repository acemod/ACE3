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

_miscProfile params ["_attackVector"];

_projPos = getPosASL _projectile;
_returnPos = _projPos vectorAdd (vectorNormalized (velocity _projectile));

if (_attackVector isEqualTo [0,0,0]) then {
    if(!(isNull _target)) then {
        _targetPos = getPosASL _target;
        _targetVector = vectorNormalized (_projPos vectorFromTo _targetPos);
        _miscProfile set [0,vectorNormalized (_projectile worldToModel (ASLToAGL _targetPos))];
    };
} else {
    _vectorPos = AGLToASL (_projectile modelToWorld _attackVector);
    _posDif = _seekerTargetPos vectorAdd (_vectorPos vectorMultiply -1);
    _returnPos = _projPos vectorAdd ((_returnPos vectorMultiply (_projPos distance _seekerTargetPos)) vectorAdd _posDif);
};

_extractedInfo set [4, _proj worldToModel (ASLToAGL _returnPos)];

_returnPos;
