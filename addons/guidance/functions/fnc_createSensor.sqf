#include "script_component.hpp"

params ["_object","_weapon","_magazine","_sensorDirection","_sensorType"];

//["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_priority", "_lastSensorReturns", "_sensorMisc"];

//IF NO OBJECT; EXIT
if(isNil "_object") exitWith {};


//IF NO SENSOR; EXIT
private _cfg = configFile >> QGVAR(SensorTypes) >> _sensorType;
private _name = getText (_cfg >> "name");

if(_name == "") exitWith {};

//GET DEFAULT SENSOR VALUES;

private _enabled = false;

private _sensorAngle = getNumber (_cfg >> "angle");
private _sensorLookVector = _object vectorModelToWorld _sensorDirection;
private _sensorLookDirection = +_sensorDirection;
private _sensorLookAngle = getNumber (_cfg >> "lookAngle");
private _range = getNumber (_cfg >> "range");
private _priority = getNumber (_cfg >> "priority");

private _lastReturnVector = [0, 0, 0];
private _lastReturnPos = [0, 0, 0];
private _lastReturnDir = [0, 0, 0];
private _lastReturnRelPos = [0, 0, 0];

private _sensorMisc = [];


//GET DEFAULT ARGUMENT VALUES
_weaponState = weaponState _object;
if(_weaponstate select 0 == "") then {
    _weaponState = weaponstate [_object, [-1]];
};

if(isNil "_weapon") then {
    _weapon = _weaponState select 0;
};

if(isNil "_magazine") then {
    _magazine = _weaponState select 3;
};

//["_object", "_weapon", "_magazine", "_sensorType", "_enabled", "_sensorDirection", "_sensorAngle", "_sensorLookVector", "_sensorLookDirection", "_sensorLookAngle", "_range", "_priority", "_lastSensorReturns", "_sensorMisc"];
_sensorParams = [_object, _weapon, _magazine, _sensorType, _enabled, _sensorDirection, _sensorAngle, _sensorLookVector, _sensorLookDirection, _sensorLookAngle, _range, _priority, [_lastReturnVector, _lastReturnPos, _lastReturnDir, _lastReturnRelPos], _sensorMisc];

GVAR(sensors) pushback _sensorParams;

_sensorParams
