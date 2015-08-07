/*
 * Author: Bohemia Interactive edit by KoffeinFlummi
 *
 * Sets the value of an ACE_Parameter and makes it public.
 *
 * Arguments:
 * 0: Unit/Vehicle
 * 1: Pitch (degrees)
 * 2: Yaw (degrees)
 * 3: Bank (degrees)
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_dirX", "_dirY", "_dirZ", "_upX", "_upY", "_upZ", "_dir", "_up", "_dirXTemp", "_upXTemp"];

params ["_object", "_aroundX", "_aroundY", "_aroundZ"];
_aroundZ = (360 - _aroundZ) - 360;

_dirX = 0;
_dirY = 1;
_dirZ = 0;
_upX = 0;
_upY = 0;
_upZ = 1;
if (_aroundX != 0) then {
  _dirY = cos _aroundX;
  _dirZ = sin _aroundX;
  _upY = -sin _aroundX;
  _upZ = cos _aroundX;
};
if (_aroundY != 0) then {
  _dirX = _dirZ * sin _aroundY;
  _dirZ = _dirZ * cos _aroundY;
  _upX = _upZ * sin _aroundY;
  _upZ = _upZ * cos _aroundY;
};
if (_aroundZ != 0) then {
  _dirXTemp = _dirX;
  _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
  _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
  _upXTemp = _upX;
  _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
  _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
};

_dir = [_dirX,_dirY,_dirZ];
_up = [_upX,_upY,_upZ];

_object setVectorDirAndUp [_dir,_up];
