#include "script_component.hpp"

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
//_sensorMisc params [];
//_center params = ["_centerPoint", "_centerObject"];

private _pos = _object modelToWorldVisualWorld [0, 0, 0];

//Get Targets and Countermeasures
_nearObjects = ((ASLToAGL _pos) nearEntities [["Air"], _range]);
private _targetsList = [];
{
    private _targetPos = _x modelToWorldVisualWorld (_x selectionPosition ["HitEngine","HitPoints"]);
    //private _targetPos = _x modelToWorldVisualWorld [0, 0, 0];
    if (
        isEngineOn _x && //check's engine
        {((_pos vectorFromTo _targetPos) vectorDotProduct (_sensorLookVector)) < _sensorLookAngle} && //targetPos can be seen by sensor;
        {[_pos, _x, _object] call FUNC(checkLOS)} //checks Line of Sight to target
    ) then {
        private _foundTargetPos = AGLToASL ((_seekerTargetsList select 0) modelToWorldWorld ((_seekerTargetsList select 0) selectionPosition ["HitEngine","HitPoints"]));
        _targetsList pushback [_x, _targetPos, acos ( (_pos vectorFromTo _targetPos) vectorDotProduct _sensorLookVector ), (_pos distance _targetPos)];
    };
} forEach _nearObjects;

// checks which countermeasures are even pointing at 
{
    _x params ["_countermeasureObject", "_type", "_enabled", "_mempoint", "_offset", "_direction", "_angle", "_misc"];
    private _countermeasurePos = _countermeasureObject modelToWorldVisualWorld [0, 0, 0];
    if (
        _type == "AAIR" && //appropriate type
        {(_pos distance _countermeasurePos) <= _range} && //in distance
        {((_pos vectorFromTo _countermeasurePos) vectorDotProduct (_sensorLookVector)) < _sensorLookAngle} && //countermeasure location can be seen by sensor
        {acos ( (_countermeasurePos vectorFromTo _pos) vectorDotProduct (_countermeasureObject vectorModelToWorldVisual _direction) ) <= _angle} && //countermeasure pointing the right way
        {[_pos, _countermeasureObject, _object] call FUNC(checkLOS)} //checks Line of Sight to target
    ) then {
        _targetsList pushback [_x, _counterMeasurePos, ( (_pos vectorFromTo _countermeasurePos) vectorDotProduct _sensorLookVector ), (_pos distance _countermeasurePos)/3];
    };
} forEach GVAR(countermeasures);

private _currentTarget = [];
{
    if (count _currentTarget == 0) then {
        _currentTarget = _x;
    } else {
        _currentTarget params ["_currentObj", "_currentPos", "_currentAngleCoef", "_currentDist"];
        _x params ["_targObj", "_targPos", "_targAngleCoef", "_targDist"];
        private _currentDistanceDivisor = sqrt(_range/_currentDist);
        private _targDistanceDivisor = sqrt(_range/_targDist);
        _currentTarget = [_currentTarget, _x] select ((_targAngleCoef * _targDistanceDivisor) <= (_currentAngleCoef * _currentDistanceDivisor));
    };
} forEach _targetsList;

if(count _targetsList > 0) then {
    [_pos vectorFromTo (_currentTarget select 1), _currentTarget select 1]
} else {
    [[0, 0, 0],[0, 0, 0]]
}
