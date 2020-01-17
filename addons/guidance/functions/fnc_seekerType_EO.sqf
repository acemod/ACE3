#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_Optic;
 *
 * Public: No
 */

params ["_projectile", "_shooter","_extractedInfo"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile"];
_miscManeuvering params ["_degreesPerSecond","_lastTickTime", "_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscSeeker params ["_focusPoint", "_innerAngle", "_outerAngle", "_focusMean", "_focusDeviation"];

private _projPos = getposASL _projectile;

if(isNil "_focusPoint") then {
    _focusPoint = lineIntersectsSurfaces [_projPos, _projPos vectorAdd ( (vectorNormalized(_targetVector)) vectorMultiply 5000)];
    _miscSeeker set [0, _focusPoint];
};

private _values = private [-3,-2, 0, 2, 3];


if(isNil "_innerAngle" || isNil "_outerAngle" || isNil "_focusMean" || isNil "_focusDeviation") then {
    //SCAAAAAAAAAAAAAAAAAAAAAAAN!
    private _unsatisfactory = true;
    private _spread = 0.1;
    while {_unsatisfactory && _spread < 2} do {
    
    
    
    
        _spread = _spread + 0.05;
    };
};


///Tracking
private _coef = ((_outerAngle / _innerAngle) - 1)/3;

private _toVector = _projPos vectorFromTo _focusPoint;
private _rightVector = _toVector vectorCrossProduct [0,1,0];
private _upVector = _rightVector vectorCrossProduct _toVector;

private _contrastLength = [];
private _contrastNormal = [];
private _contrastObj = [];
private _contrastTherm = [];

{
    _y = _x;
    _valueY = _innerAngle + (_coef * (_y - (_y/abs(_y))) );
    if (_y == 0) then {_valueY = 0};
    {
        _valueX = _innerAngle + (_coef * (_x - (_x/abs(_x))) );
        if (_x == 0) then {_valueX = 0};
        
        private _vector = [_toVector, _rightVector, _valueY] call CBA_fnc_vectRotate3D
        _vector = [_vector, _upVector, _valueX] call CBA_fnc_vectRotate3D;
        _point = lineIntersectsSurfaces [_projPos, _projPos vectorAdd (_vector vectorMultiply _seekerMaxRange), _projectile];
        if (count _point) then {
            _contrastLength pushBack [];
            _contrastNormal pushBack [];
            _contrastObj pushBack [];
            _contrastTherm pushBack [];
        } else {
            _contrastLength pushBack (_projPos distance (_point select 0));
            _contrastNormal pushBack (_point select 1);
            _contrastObj pushBack (_point select 2);
            _contrastTherm pushBack (isEngineOn (_point select 2));
        };
        
    } forEach _values;
} forEach _values;



