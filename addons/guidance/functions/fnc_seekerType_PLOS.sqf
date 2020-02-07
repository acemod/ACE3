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
_difs params ["_vect","_crossVector","_ang"];



//if(!_active) exitWith {[0,0,0]};

if (isNil "_difs")  then {
    _vect = [0,0,0];
    _crossVector = [0,0,1];
    _ang = 0;
};

if (_vect isEqualTo [0,0,0]) then {
    _vect = vectorNormalized (velocity _projectile);
    hint str [_vect];
};

private _vars = _shooter getVariable [QGVAR(PLOSVars), nil];
if (!(isNil "_vars")) then {
    _crossVector  = (_vars select 2) select 0;
    _ang  = (_vars select 2) select 1;
};

private _projPos = getPosASL _projectile;
if(_ang != 0) then {
    _vect = [_vect, _crossVector, 2 * _ang * _runtimeDelta] call CBA_fnc_vectRotate3D; //magic number
};

_difs set [0, _vect];
_difs set [1, _crossVector];
_difs set [2, _ang];


private _projPos = getPosASL _projectile;

_projPos vectorAdd _vect;
