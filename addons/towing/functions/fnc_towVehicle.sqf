/*
 * Author: GitHawk
 * Tows a vehicle.
 *
 * Arguments:
 * 0: ...
 *
 * Return Value:
 * None
 *
 * Example:
 * [towTruck, towedVehicle] call ace_towing_fnc_towVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_towTruck", "_towedTruck"];

[{
    params ["_args", "_idPFH"];
    _args params ["_towTruck", "_vehicle"];

    _posTowTruck = getPosATL _towTruck;
    _posTow = _posTowTruck vectorAdd ((vectorDir _towTruck) vectorMultiply -5);

    _state = _vehicle getVariable [QGVAR(towState), -1];
    if (_state == -1) exitWith {};
    if (_state == 1) then {
        _vehicle enableSimulation false;
        _towTruck setHitpointDamage ["HitEngine", 1];
        _dirV = (getPosATL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _angle = _dir - (getDir _vehicle);
        if(_angle > 180) then {_angle = _angle - 360;};
        if(_angle < -180) then {_angle = _angle + 360;};

        _vehicle setVariable [QGVAR(towStart), time];
        _vehicle setVariable [QGVAR(towState), 2];
        _vehicle setVariable [QGVAR(towAngle), _angle];
    };
    if (_state == 2) then {
        _dirV = (getPosATL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _start = _vehicle getVariable [QGVAR(towStart), time];
        _angle = _vehicle getVariable [QGVAR(towAngle), 45];

        _dt = time - _start;
        if ((_dt * 5) > abs(_angle)) then {
            _vehicle setDir _dir;
            _state = 3;
            _vehicle setVariable [QGVAR(towState), 3];
            _vehicle setVariable [QGVAR(towStart), time];
            _vehicle setVariable [QGVAR(towDistance), (getPosATL _vehicle) distance (_posTow)];
        } else {
            _vehicle setDir (_dir - _angle +  _dt * 5 * _angle / abs(_angle));
        };
    };
    if (_state == 3) then {
        _dirV = (getPosATL _vehicle) vectorFromTo _posTow;
        _start = _vehicle getVariable [QGVAR(towStart), time];
        _distance = _vehicle getVariable [QGVAR(towDistance), (getPosATL _vehicle) distance (_posTow)];

        _dt = time - _start;
        if (_dt > (_distance - 7)) then {
            _vehicle setVariable [QGVAR(towState), 4];
            _towTruck setHitpointDamage ["HitEngine", 0];
        } else {
            _distance = -7 - (_distance - 7) + _dt;
            _posVeh = _posTow vectorAdd (_dirV vectorMultiply _distance);
            _vehicle setPosATL _posVeh;
        };
    };
    if (_state == 4) then {
        _lastPosVeh = _vehicle getVariable [QGVAR(lastPosVeh), getPosATL _vehicle];
        _dirV = _lastPosVeh vectorFromTo _posTow;
        _posVeh = _posTow vectorAdd (_dirV vectorMultiply -7);

        _dirV = _lastPosVeh vectorFromTo _posVeh;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        if (_dir < 0) then {_dir = 360 + _dir};

        hint str _posTowTruck;
        _posVeh set [2, 0];

        _angle = (velocity _towTruck) vectorCos (vectorDir _towTruck);
        if (_angle < 0) then {
            _dir = _dir - 180;
        };

        if ((_posVeh distance _lastPosVeh) > .1) then {
            _vehicle setDir _dir;
            _vehicle setVariable [QGVAR(lastPosVeh), _posVeh];
        };
        _normal = [0,0,1];
        {
            _normal = _normal vectorAdd (surfaceNormal (_posVeh vectorAdd _x));
        } foreach [[1,0,0], [0,1,0], [-1,0,0], [0,-1,0]];
        _vehicle setVectorUp _normal;
        _vehicle setPosATL _posVeh;
    };
    if (_state == 5) then {
        _vehicle setVariable [QGVAR(lastPosVeh), nil];
        _vehicle getVariable [QGVAR(towState), nil];
        _vehicle enableSimulation true;
        [_idPFH] call cba_fnc_removePerFrameHandler;
    };

}, 0, [_towTruck, _towedTruck] ] call cba_fnc_addPerFrameHandler;


_towedTruck setVariable [QGVAR(towState), 1];
