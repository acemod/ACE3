#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 0: Projectile <OBJ>
 * 1: Seeker Search Direction <NUMBER>
 * 2: Seeker Max Angle <NUMBER>
 * 3: Seeker Misc <ARRAY>
 *
 * Return Value:
 * Vector to target position <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_INS;
 *
 * Public: No
 */
params ["_projectile", "_shooter","_extractedInfo"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile"];
_miscManeuvering params ["_degreesPerSecond", "_glideAngle", "_lastTickTime", "_lastRunTime", "_runtimeDelta"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscSeeker params ["_active","_difs"];
_difs params ["_yawDif","_pitchDif"];

if(!_active) exitWith {[0,0,0]};

private _projPos = getPosASL _projectile;
private _vector = vectorNormalized (velocity _projectile);

private _rightVector = [0,1,0] vectorCrossProduct _vector;
private _upVector = _vector vectorCrossProduct _rightVector;

_vector = [_vector, _rightVector, _pitchDif * _runtimeDelta] call CBA_fnc_vectRotate3D;
_vector = [_vector, _rightVector, _yawDif * _runtimeDelta] call CBA_fnc_vectRotate3D;

[0,0,0];
