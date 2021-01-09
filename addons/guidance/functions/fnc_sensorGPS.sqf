#include "script_component.hpp";

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_targetPoint", "_pointsList", "_pointsIndex"];
//_pointslist params = [["_point", "_pointRadius"],["_point2", "_pointRadius2"]...["_pointN", "_pointRadiusN"]];

if (isNil "_targetPoint") then {
    _targetPoint = [0, 0, 0];
};
if (isNil "_pointsList") then {
    _pointsList = [];
    _sensorMisc set [1, _pointsList];
};
if (isNil "_pointsIndex") then {
    _pointsIndex = -1;
    _sensorMisc set [2, _pointsIndex];
};

if ((_pointsIndex == -1) && {hasPilotCamera _object}) then {
    _targetPoint = (getPilotCameraTarget _object) select 1;
} else {
    if( _targetPoint isEqualTo [0,0,0]) then {
        _targetPoint = (_pointsList select _pointsIndex) select 0;
    };
};

if (_pointsIndex > count (_pointsList)) exitWith { [[0, 0, 0],[0, 0, 0]] };

if (_pointsIndex > -1) then {
    if ( (_pos distance ((_pointsList select _pointsIndex) select 0)) < ((_pointsList select _pointsIndex) select 1) ) then {
        _pointsIndex = _pointsIndex + 1;
    };
};

_sensorMisc set [0, _targetPoint];
_sensorMisc set [2, _pointsIndex];

[_pos vectorFromTo _targetPoint, _targetPoint]
