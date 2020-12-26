#include "script_component.hpp"


params ["_object", "_sensorType", "_sensorVector", "_sensorAngle", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc", "_function"];

/////
_sensorAngle = 90;
_sensorLookAngle = 45;
/////


private _pos = _object modelToWorldVisualWorld [0, 0, 0];

// All angles are full cones
private _maxDeg = (_sensorAngle - _sensorLookAngle)/2;

private _angleDif = acos (_sensorVector vectorDotProduct _sensorLookVector); 
private _crossVector = _sensorVector vectorCrossProduct _sensorLookVector;

if (_angleDif > 0) then {
    _sensorLookVector = [_sensorVector, _crossVector, (_angleDif min _maxDeg)] call CBA_fnc_vectRotate3D;
};


//private _returns = [_object, _pos, _sensorLookVector, _sensorLookAngle/2, _range, _sensorMisc] call (missionNamespace getvariable _function);
private _returns = [_object, _pos, _sensorLookVector, _sensorLookAngle/2, _range, _sensorMisc] call (ace_guidance_fnc_sensorAAIR);

private _returnVector = _returns select 0;
private _crossVector = _sensorLookVector vectorCrossProduct _returnVector;
private _ang = acos (_sensorLookVector vectorDotProduct _returnVector);

[_returns, _sensorLookVector, _crossVector, _ang]
