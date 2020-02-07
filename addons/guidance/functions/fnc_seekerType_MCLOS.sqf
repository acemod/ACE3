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
params ["_projectile", "_shooter", "_extractedInfo"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile"];
_miscManeuvering params ["_degreesPerSecond", "_glideAngle", "_lastTickTime", "_lastRunTime", "_runtimeDelta"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscSeeker params ["_active","_maxYaw","_maxPitch","_returnWithoutInput","_launchVector", "_flightVector"];

if(!_active) exitWith {[0,0,0]};

if(_projectile != (_shooter getVariable [QGVAR(MCLOSMissile), objNull])) exitWith {[0,0,0]};

if(time - _launchTime < 0.75) exitWith {
    _launchVector = eyeDirection _shooter;
};

private _projPos = getPosASL _projectile;

if(isNil "_launchVector") then {
    _launchVector = vectorNormalized (velocity _projectile);
};

if (_returnWithoutInput) then {
    _flightVector = _launchVector;
};

if(isNil "_flightVector") then {
    _flightVector = vectorNormalized (velocity _projectile);
    _miscSeeker set [5, _flightVector];
};

private _vector = _flightVector;

if(isNil "_maxYaw") then {
    _maxYaw = _degreesPerSecond;
    _miscSeeker set [1, _maxYaw];
};
if(isNil "_maxPitch") then {
    _maxPitch = _degreesPerSecond;
    _miscSeeker set [2, _maxPitch];
};

private _inputs = _shooter getVariable [QGVAR(MCLOSInputs), [0,0]];

_yawDif = (_inputs select 0) * (_maxYaw);
_pitchDif = (_inputs select 1) * (_maxPitch);


private _rightVector = _vector vectorCrossProduct [0,0,1];
private _upVector = _vector vectorCrossProduct _rightVector;

if(_yawDif != 0) then {
    _flightVector = [_flightVector, _upVector, _yawDif] call CBA_fnc_vectRotate3D;
};

if(_pitchDif != 0) then {
    _flightVector = [_flightVector, _rightVector, _pitchDif] call CBA_fnc_vectRotate3D;
};

if (_returnWithoutInput) then {
    private _ang = acos(_flightVector vectorCos _launchVector);
    if(_ang != 0) then {
        private _crossVector = _launchVector vectorCrossProduct _flightVector;
        _launchVector = [_launchVector, _crossVector, _ang * _runtimeDelta] call CBA_fnc_vectRotate3D;
    };
};

_miscSeeker set [4, _launchVector];
_miscSeeker set [5, _flightVector];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.75,0,1], ASLtoAGL (_projPos vectorAdd (_launchVector vectorMultiply 10)), 0.75, 0.75, 0, "launch", 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,1,1], ASLtoAGL (_projPos vectorAdd (_flightVector vectorMultiply 10)), 0.75, 0.75, 0, "flight", 1, 0.025, "TahomaB"];

_projPos vectorAdd _launchVector;
