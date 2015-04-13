/*
 * Author: jaynus
 * Returns whether the target position is within the maximum angle FOV of the provided seeker 
 * objects current direction.
 *
 * Argument:
 * 0: Seeker [Object]
 * 1: Target [Position]
 * 2: Max Angle [Degrees]
 * 
 * Return value:
 *    Boolean
 */
 
 #define DEBUG_MODE_FULL
#include "script_component.hpp"
private["_seeker", "_targetPos", "_seekerMaxAngle", "_vectorTo", "_sensorPos", "_vertOk", "_horzOk", "_dir", "_headingPitch"];

_seeker = _this select 0;
_targetPos = _this select 1;
_seekerMaxAngle = _this select 2;

_vertOk = false;
_horzOk = false;

_sensorPos = getPosASL _seeker;
_vectorTo = _sensorPos vectorFromTo _targetPos;

_headingPitch = (vectorDir _seeker) call CBA_fnc_vect2polar;
_polarTo = _vectorTo call CBA_fnc_vect2polar;

_dir = _polarTo select 1;
_dir = _dir - (_headingPitch select 1);

if (_dir < 0) then {_dir = _dir + 360};
if (_dir > 360) then {_dir = _dir - 360};
    _vertOk = false;
    _horzOk = false;
if(_dir < _angleFov || {_dir > (360-_angleFov)}) then {
    _horzOk = true;
};
if(abs((abs(_polarTo select 2))-(abs(_headingPitch select 2))) < _angleFov) then {
    _vertOk = true;
};

if(!_vertOk || !_horzOk ) exitWith {
    false 
};

true