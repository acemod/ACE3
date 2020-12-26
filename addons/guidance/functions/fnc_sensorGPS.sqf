#include "script_component.hpp";

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_pointsList", "_pointsIndex", "_pointsRadius"];

GVAR(timeVars) params ["_lastRunTime", "_deltaTime", "_lastDiagTime", "_diagDeltaTime"];

if (isNil "_pointsList") then {
    _pointsList = [[0, 0, 0]];
    _sensorMisc set [0, _pointsList];
};
if (isNil "_pointsIndex") then {
    _pointsIndex = 0;
    _sensorMisc set [1, _pointsIndex];
};
if (isNil "_pointsRadius") then {
    _pointsRadius = 15;
    _sensorMisc set [2, _pointsRadius];
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
