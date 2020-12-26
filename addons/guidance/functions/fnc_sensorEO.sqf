#include "script_component.hpp"

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_locked", "_focusAngle", "_minFocusAngle", "_maxFocusAngle", "_currentPointsList", "_pointsList", ""];
//_center params = ["_centerPoint", "_centerObject"];



if (isNil "_locked") then {
    _locked = false;
    _sensorMisc set [0, _locked];
};
if (isNil "_minFocusAngle") then {
    _minFocusAngle = 0.5;
    _sensorMisc set [2, _minFocusAngle];
};
if (isNil "_maxFocusAngle") then {
    _maxFocusAngle = _sensorLookAngle max _minFocusAngle;
    _sensorMisc set [3, _maxFocusAngle];
};
if (isNil "_focusAngle") then {
    _focusAngle = _minFocusAngle;
    _sensorMisc set [1, _focusAngle];
};

if(isNil "_currentPointsList" || {count _currentPointsList < 1}) exitWith {
    _currentPointsList = [];
    private _toPos = _pos vectorAdd (_sensorLookVector vectorMultiply 5000);
    private _results = lineIntersectsSurfaces [_pos, _toPos, _object, objNull];
    if (count _results == 0) then {
        _results = [[_toPos, [], objNull]];
    };
 
    _results = _results select 0;
    if( !(isNull (_results select 2)) && {(_results select 2) isKindOf "allVehicles"} )  then {
        _currentPointsList pushBack [(_results select 2) worldToModelVisual ASLToAGL (_results select 0), _results select 2, [0,0, true]];
    } else {
        _currentPointsList pushBack [_results select 0, objNull, [0, 0, true]];
    };
    _sensorMisc set [4, _currentPointsList]; // _currentPointsList;
    [[0,0,0],[0,0,0]]
};

if(isNil "_pointsList") then {
    _pointsList = [];
    _sensorMisc set [5, _pointsList]; // _pointsList;
};

//hint str _currentPointsList; 
private _toPoint = (_currentPointsList select 0) select 0;

if !( isNull ((_currentPointsList select 0) select 1) ) then {
    _toPoint = _currentPointsList select 0 select 1 modelToWorldVisualWorld (_currentPointsList select 0 select 0);
};
private _toVector = _pos vectorFromTo _toPoint;


for "_i" from 1 to 8 do {
    private _angle = random [0,_focusAngle/10, _focusAngle];
    private _bearing = random 360;

    private _newVector = [_toVector, [0, 1, 0], -(_angle)] call CBA_fnc_vectRotate3D;
    _newVector = [_newVector, _toVector, _bearing] call CBA_fnc_vectRotate3D;
    
    private _toPos = _pos vectorAdd (_newVector vectorMultiply 5000);
//    hint format ["%1\n%2\n%3", _pos, _toVector, _angle];    
    private _point = lineIntersectsSurfaces [_pos, _toPos, _object, objNull];
    
    if(count _point > 0) then {
        if(!(isNull ((_point select 0) select 2)) && (((_point select 0) select 2) isKindOf "allVehicles"))  then {
            _currentPointsList pushBack [((_point select 0) select 2) worldToModel ASLToAGL ((_point select 0) select 0), (_point select 0) select 2, [_angle, _bearing, true]];
        } else {
            _currentPointsList pushBack [(_point select 0) select 0, objNull, [_angle, _bearing, true]];
        };
    } else {
        _currentPointsList pushBack [_pos vectorAdd (_newVector vectorMultiply 5000), objNull, [_angle, _bearing]];
    };
};

{
    _x params ["_pointPos", "_pointObj", "_pointParams"];
    _pointParams params ["_angle", "_bearing"];
    if (!isNull _pointObj) then {
        _pointPos = _pointObj modelToWorldVisualWorld _pointPos;
    };
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.5,0,cos(_angle)], ASLToAGL _pointPos, 0.75, 0.75, 0, str cos(_angle), 1, 0.025, "TahomaB"];

} forEach _currentPointsList;


private _count = count _currentPointsList;
private _meanVector = [0, 0, 0];
private _vectorStandardDeviation = 0;
private _meanCenter = [0, 0, 0];
private _meanCenterDivisor = 0;
private _centerStandardDeviation = 0;

if(_count >= 60) then {

    //Find our means (weighted)
    private _centerPoint = (_currentPointsList select 0) select 0;
    if !(isNull ((_currentPointsList select 0) select 1)) then {
        _centerPoint = ((_currentPointsList select 0) select 1) modelToWorldVisualWorld _centerPoint;
    };
    private _centerVector = _pos vectorFromTo _centerPoint;
    {
        _x params ["_pointPos", "_pointVehicle", "_pointParams"];
        _pointParams params ["_angle", "_bearing"];
        private _toPoint = +_pointPos;
        if !(isNull _pointVehicle) then {
            _toPoint = +(_pointVehicle modelToWorldVisualWorld _pointPos);
        };
        
        private _toVector = _pos vectorFromTo _toPoint;
        private _multiplier = ((cos(_angle)/3)^4) * ([1, 10] select (isNull _pointVehicle));
        private _meanCenter = _meanCenter vectorAdd (_toPoint vectorMultiply _multiplier);
        private _meanCenterDivisor = _meanCenterDivisor + _multiplier;
        _meanVector = _meanVector vectorAdd (_toVector vectorMultiply _multiplier);
    } forEach _currentPointsList;
    
    _meanVector = vectorNormalized _meanVector;

    if (_meanCenterDivisor > 0) then {
        _meanCenter = _meanCenter vectorMultiply (1/_meanCenterDivisor);
    };

    _vectorRadicandNumerator = 0;
    _centerRadicandNumerator = 0;
    {
        _x params ["_pointPos", "_pointVehicle", "_pointParams"];
        _pointParams params ["_angle", "_bearing"];
        private _toPoint = +_pointPos;
        if !(isNull _pointVehicle) then {
            _toPoint = +(_pointVehicle modelToWorldVisualWorld _pointPos);
        };

        private _toVector = _pos vectorFromTo _toPoint;
        _vectorRadicandNumerator = _vectorRadicandNumerator + (_meanVector vectorDotProduct _toVector)^2;
        _centerRadicandNumerator = _centerRadicandNumerator + (_toPoint distance _meanCenter)^2;
    } forEach _currentPointsList;
    
    _vectorStandardDeviation = sqrt (_vectorRadicandNumerator/((_count - 1) max 1) );
    _centerStandardDeviation = sqrt (_centerRadicandNumerator/((_meanCenterDivisor - 1) max 1));
    
    _pointsList pushBack [_meanVector, _meanCenter, _vectorStandardDeviation, _centerStandardDeviation];
    _currentPointsList deleteRange [0, (count _currentPointsList)];
};

{
    _x params ["_meanVector", "_meanCenter", "_vectorStandardDeviation", "_centerStandardDeviation"];
} forEach _pointList; 

if(count _pointsList > 10) then {
    _pointsList deleteRange [0, (count _currentPointsList)];
};

[_toVector, _toPoint]
