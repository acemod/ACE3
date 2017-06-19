/*
 * Author: Bohemia Interactive edit by KoffeinFlummi
 * Sets the value of an ACE_Parameter and makes it public.
 *
 * Arguments:
 * 0: Unit/Vehicle <OBJECT>
 * 1: Pitch <NUMBER>
 * 2: Yaw <NUMBER>
 * 3: Bank <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 1, 2, 3] call ace_common_fnc_setPitchBankYaw
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_object", "_aroundX", "_aroundY", "_aroundZ"];

_aroundZ = - _aroundZ;

private _dirX = 0;
private _dirY = 1;
private _dirZ = 0;
private _upX = 0;
private _upY = 0;
private _upZ = 1;

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
    private _dirXTemp = _dirX;
    _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
    _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);

    private _upXTemp = _upX;
    _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
    _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
};

private _dir = [_dirX, _dirY, _dirZ];
private _up = [_upX, _upY, _upZ];

_object setVectorDirAndUp [_dir,_up];
