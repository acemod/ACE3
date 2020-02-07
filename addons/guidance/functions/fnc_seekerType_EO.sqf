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
_miscManeuvering params ["_degreesPerSecond", "_glideAngle", "_lastTickTime", "_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscSeeker params ["_active", "_focusPoint", "_points"];

if(!_active) exitWith {[0,0,0]};

_seekerMaxRange = 5000;

//weird sanity check, just in case because below can be CPU heavy stuff
if(isNull _projectile) exitWith {[0,0,0]};

private _projPos = getposASL _projectile;

if(isNil "_focusPoint" || (count _focusPoint) <= 0 ) exitWith {
    _focusPoint = terrainIntersectAtASL [_projPos, _projPos vectorAdd (_finalVector vectorMultiply 10000)];
    if((count _focusPoint) < 1) then {
        _focusPoint = _projPos vectorAdd (_finalVector vectorMultiply 10000)
    };
    _miscSeeker set [1, _focusPoint];
};

private _toVector = _projPos vectorFromTo _focusPoint;

if(acos(_toVector vectorCos (vectorNormalized( velocity _projectile))) > _seekerAngle) exitWith {[0,0,0]};

private _rightVector = _toVector vectorCrossProduct [0,1,0];
private _upVector = _rightVector vectorCrossProduct _toVector;

if(isNil "_points") then {
    _points = [];
};

for "_i" from 1 to 5 do {
    private _bearing = random 360;
    private _angle = random [0,0.03,2];
    private _vector = [_toVector, _rightVector, _angle * cos(_bearing)] call CBA_fnc_vectRotate3D;
    _vector = [_vector, _upVector, _angle * sin(_bearing)] call CBA_fnc_vectRotate3D;
    private _point = (lineIntersectsSurfaces [_projPos, _projPos vectorAdd (_vector vectorMultiply _seekerMaxRange), _shooter, _projectile, true]);
    if(count _point > 0) then {
        if(!(isNull ((_point select 0) select 2)) && (((_point select 0) select 2) isKindOf "allVehicles"))  then {
            _points pushBack [((_point select 0) select 2) worldToModel ASLToAGL ((_point select 0) select 0), (_point select 0) select 2, [_bearing,_angle]];
        } else {
            _points pushBack [(_point select 0) select 0, objNull, [_bearing,_angle]];
        }
    } else {
        _points pushBack [_projPos vectorAdd (_vector vectorMultiply _seekerMaxRange), objNull, [_bearing, _angle]];
    };
};

if(count _points > 100) then {
    private _ret = _points deleteRange [0,5];
};

if(count _points < 1) then {
    _points = nil;
};
_miscSeeker set [2,_points];

private _finalVector = [0,0,0];
private _finalPoint = [0,0,0];
private _divisor = 0;
private _vehMult = 2;
private _thermMult = 100;

{
    private _mult = 1;
    _color = [0.8,0.8,0.8,0.6];
    private _addPoint = _x select 0;
    if(!(isNull (_x select 1)) && ((_x select 1) isKindOf "allVehicles")) then {
        _addPoint = AGLToASL ((_x select 1) modelToWorld (_x select 0));
        _color = [0.5,0.25,0,1];
        if(isEngineOn (_x select 1)) then {
            _mult = _vehMult * _thermMult;
            _color = [1,0.85,0.1,1];
        } else {
            _mult = _vehMult;
        };
    };
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", _color, ASLtoAGL (_addPoint), 0.75, 0.75, 0, format ["[%1,%2]",_x select 2 select 0, _x select 2 select 1], 1, 0.025, "TahomaB"];
    private _vector = _projPos vectorFromTo _addPoint;
    _vector = [_vector, _rightVector, -cos((_x select 2) select 0) * ((_x select 2) select 1)] call CBA_fnc_vectRotate3D;
    _vector = [_vector, _upVector, -sin((_x select 2) select 0) * ((_x select 2) select 1)] call CBA_fnc_vectRotate3D;
    _finalVector = _finalVector vectorAdd (_vector vectorMultiply _mult);
    _finalPoint = _finalPoint vectorAdd (_addPoint vectorMultiply _mult);
    _divisor = _divisor + _mult;
} forEach _points;
//hint format ["%1", _divisor/(count _points)];
_finalVector = _finalVector vectorMultiply (1/(_divisor max 1));
_finalPoint = _finalPoint vectorMultiply (1/(_divisor max 1));


private _pivotVector = (_projPos vectorFromTo _focusPoint) vectorCrossProduct (_projPos vectorFromTo _finalPoint);
private _pivotAmt = acos((_projPos vectorFromTo _focusPoint) vectorCos (_projPos vectorFromTo _finalPoint)) min 0.025;
if(_pivotAmt > 0) then {
    private _finalVector = [_finalVector, _pivotVector, _pivotAmt] call CBA_fnc_vectRotate3D;
};
private _seekerTargetPos = terrainIntersectAtASL [_projPos, _projPos vectorAdd (_finalVector vectorMultiply 10000)]; 
_miscSeeker set [1, _seekerTargetPos];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL (_finalPoint), 0.75, 0.75, 0, "finalPoint", 1, 0.025, "TahomaB"];
//_projPos vectorAdd (_finalVector);
_seekerTargetPos;
//[0,0,0];
//hint format ["%1\n%2\n%3", _projPos, _totalVector, _seekerMaxRange];

