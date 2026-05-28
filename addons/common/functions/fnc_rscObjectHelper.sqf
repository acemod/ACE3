#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Convert between screen and 3d object coordinates
 *
 * Arguments:
 * 0: Function <STRING>
 * 1: Input array <ARRAY>
 * 2: Scale <NUMBER> (default: 1)
 *
 * Return Value:
 * Value <ARRAY>
 *
 * Example:
 * ["2d", [0,0,0], 1] call ace_common_fnc_rscObjectHelper
 *
 * Public: No
 */

params ["_func", "_array", ["_scale", 1]];

private _adjustCam = 1;
private _topFOV = getResolution # 6;
private _leftFOV = getResolution # 7;

private _topLeftX = (_leftFOV-1)*0.5/_leftFOV;
private _bottomRightX =  1-_topLeftX;
private _topLeftY = 0;
private _bottomRightY = 1;

private _return = [];

switch (toLowerANSI _func) do {
    case ("2d"): {
        _array params ["_pointX", "_z", "_pointY"];

        private _scrX = _pointX * (_bottomRightX - _topLeftX) + _topLeftX;
        private _vX = _leftFOV * (_scrX - 0.5) * _adjustCam * _z;

        private _scrY = _pointY * (_bottomRightY - _topLeftY) + _topLeftY;
        private _vY = _topFOV * (0.5 - _scrY) * _adjustCam * _z;

        _vX = _vX / _scale;
        _vY = _vY / _scale;

        _return = [_vX, _vY, _z];
    };
    case ("3d"): {
        _array params ["_vX", "_vY", "_z"]; // z is distance from screen

        _vX = _vX * _scale;
        _vY = _vY * _scale;

        private _scrX = _vX / (_leftFOV * _adjustCam * _z) + 0.5;
        private _pointX = (_scrX - _topLeftX) / (_bottomRightX - _topLeftX);

        private _scrY = 0.5 - _vY / (_topFOV * _adjustCam * _z);
        private _pointY = (_scrY - _topLeftY) / (_bottomRightY - _topLeftY);

        _return = [_pointX, _z, _pointY];
    };
};

_return
