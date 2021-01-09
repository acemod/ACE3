#include "script_component.hpp";

hint "run SALH!";

params ["_object", "_pos", "_sensorLookVector", "_sensorLookAngle", "_range", "_sensorMisc"];
_sensorMisc params ["_seekerCode", "_laserMinWavelength", "_laserMaxWavelength"];

////DEBUG
_range = 5000;
///////

if (isNil "_seekerCode") then {
    _seekerCode = _object getVariable [QGVAR(laserCode), 1111];
    _sensorMisc set [0, _seekerCode];
};
if (isNil "_laserMinWavelength") then {
    _sensorMisc set [1, 1550];
};
if (isNil "_laserMaxWavelength") then {
    _sensorMisc set [2, 1550];
};

private _spots = [];
{
    _x params ["_targetObject", "_owner", "_laserUuid", "_laserCode"];
    private _targetPos = getPosASLVisual _targetObject;

    if (
        _laserCode != _seekerCode || 
        {_pos distance _targetPos > _range} ||
        {acos((_pos vectorFromTo _targetPos) vectorDotProduct (_sensorLookVector)) > _sensorLookAngle} //targetPos can be seen by sensor;
    ) exitWith {};
    private _retrievedHash = [ace_laser_laserEmitters, _laserUuid] call CBA_fnc_hashGet;
    _retrievedHash params ["_hashObj", "_hashOwner", "_hashLaserMethod", "_hashEmitterWavelength", "_hashLaserCode", "_hashDivergence"];
    if (
        !alive _hashObj || 
        {_hashEmitterWavelength < _seekerWavelengthMin} || 
        {_hashEmitterWavelength > _seekerWavelengthMax} ||
        [_pos, _targetObject, _object] call FUNC(checkLOS) 
    ) exitWith {};
    
    _spots pushBack [_targetObject, _targetPos, acos ((_pos vectorFromTo _targetPos) vectorDotProduct _sensorLookVector ), (_pos distance _targetPos)];
    
} forEach EGVAR(laser,trackedLaserTargets);

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
} forEach _spots;

hint str _spots;

if(count _spots > 0) then {
    [_pos vectorFromTo (_currentTarget select 1), _currentTarget select 1]
} else {
    [[0, 0, 0],[0, 0, 0]]
}