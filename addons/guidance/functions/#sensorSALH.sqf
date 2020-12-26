#include "script_component.hpp";

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_laserCode", "_laserMinWavelength", "_laserMaxWavelength"];

if (isNil "_laserCode") then {
    _laserCode = _object getVariable [QGVAR(laserCode), 1111];
    _sensorMisc set [0, _laserCode];
};
if (isNil "_laserMinWavelength") then {
    _sensorMisc set [1, 1550];
};
if (isNil "_laserMaxWavelength") then {
    _sensorMisc set [2, 1550];
};

if (_pointsIndex > count (_pointsList)) exitWith { [[0, 0, 0],[0, 0, 0]] };

private _GPSPos = _object getVariable [QGVAR(GPSPos), [0, 0, 0]];
if !(_GPSPos isEqualTo [0, 0, 0]) then {
    _sensorMisc set [1, [_GPSPos]];
};

private _velocity = velocity _object;
private _point = (_pointsList select _pointsIndex);
private _distanceToPoint = _pos distance _point;
private _futureDistanceToPoint = (_pos vectorAdd (_velocity vectorMultiply _deltaTime));

if (_distanceToPoint < _pointsRadius && {_distanceToPoint < _futureDistanceToPoint}) then {
    _sensorMisc set [1, _pointsIndex + 1];
};

[_pos vectorFromTo _point, _point]
