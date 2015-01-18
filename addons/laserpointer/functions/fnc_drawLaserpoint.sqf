// by commy2
#include "script_component.hpp"

private ["_unit", "_range", "_isGreen"];

_unit = _this select 0;
_range = _this select 1;
_isGreen = _this select 2;

_p0 = _unit modelToWorld (_unit selectionPosition "righthand");
_d  = _unit weaponDirection currentWeapon _unit;

_p1 = _p0 vectorAdd (_d vectorMultiply _range);
_pA = _p0 vectorAdd (_d vectorMultiply 0.5);

_offset0 = getTerrainHeightASL _p0;
_offset1 = getTerrainHeightASL _p1;
_offsetA = getTerrainHeightASL _pA;

_p1 = _p1 vectorAdd [0, 0, _offset0 - _offset1];
_p0 = _pA vectorAdd [0, 0, _offset0 - _offsetA];

_fnc_getDistance = {
    private "_distance";

    _pX = + _p0;
    _line = [ATLToASL _p0, ATLToASL _pX];

    _distance = _this;
    _iteration = _distance;

    while {
        _iteration > 0.01 / 2
    } do {
        _iteration = _iteration / 2;

        _pX = _p0 vectorAdd (_d vectorMultiply _distance);

        _offsetX = getTerrainHeightASL _pX;

        _pX = _pX vectorAdd [0, 0, _offset0 - _offsetX];

        _line set [1, ATLToASL _pX];

        _distance = _distance + (([1, -1] select (lineIntersects (_line + [_unit]) || {terrainIntersectASL _line})) * _iteration);

        if (_distance > _this) exitWith {_distance = _this};
    };

    _distance
};

_distance = _range call _fnc_getDistance;

_units = nearestObjects [_unit, ["Man"], _distance];
_units deleteAt (_units find _unit);

_fnc_doesIntersect = {
    _pX = _p0 vectorAdd (_d vectorMultiply (_this select 1));

    _offsetX = getTerrainHeightASL _pX;

    _pX = _pX vectorAdd [0, 0, _offset0 - _o1];

    count ([_this select 0, "FIRE"] intersect [_p0, _pX]) > 0
};

{
    if ([_x, _distance] call _fnc_doesIntersect) then {
        _distance = _distance min (_unit distance _x);
    };
} forEach _units;

//systemChat str _distance;
if (_distance < 0.5) exitWith {};

_pL = _p0 vectorAdd (_d vectorMultiply _distance);
_pL2 = _p0 vectorAdd (_d vectorMultiply (_distance - 0.5));

_offsetL = getTerrainHeightASL _pL;
_offsetL2 = getTerrainHeightASL _pL2;

_pL = _pL vectorAdd [0, 0, _offset0 - _offsetL];
_pL2 = _pL2 vectorAdd [0, 0, _offset0 - _offsetL2];

drawLine3D [
    _p0,
    _pL,
    [[1,0,0,1], [0,1,0,1]] select _isGreen
];

_spL = worldToScreen _pL; //systemChat str _spL;
_size = 2 * (_range - (positionCameraToWorld [0,0,0] distance _pL)) / _range;

_camPos = positionCameraToWorld [0,0,0.2];
if (count ([_unit,      "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};
if (count ([ACE_player, "FIRE"] intersect [_camPos, _pL]) > 0) exitWith {};
if (                     terrainIntersect [_camPos, _pL2])      exitWith {};
if (lineIntersects [ATLToASL _camPos, ATLToASL _pL2])           exitWith {};

drawIcon3D [
    format ["\a3\weapons_f\acc\data\collimdot_%1_ca.paa", ["red", "green"] select _isGreen],
    [[1,0.25,0.25,0.5*_brightness], [0.25,1,0.25,0.5*_brightness]] select _isGreen,
    _pL,
    _size,
    _size,
    45,
    "",
    0,
    0.05
];
