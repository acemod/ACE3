/*
 * Author: GitHawk
 * Tows a vehicle.
 *
 * Arguments:
 * 0: Towing Vehicle <OBJECT>
 * 1: Towed Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [towing, towed] call ace_towing_fnc_towVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_towing", "_towed"];

_towed setVariable [QGVAR(towState), 1];

[{
    params ["_args", "_pfID"];
    _args params ["_towing", "_vehicle"];

    _state = _vehicle getVariable QGVAR(towState);

    if (isNil "_state") exitWith {
        _vehicle setVariable [QGVAR(lastPosVeh), nil];
        _vehicle setVariable [QGVAR(towState), nil];
        _lastPosVeh = getPosASL _vehicle;
        _vehicle setPosASL [_lastPosVeh select 0, _lastPosVeh select 1, (_lastPosVeh select 2) + 0.1];
        _towing setHitpointDamage ["HitEngine", 0]; // TODO MP
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    _posTowTruck = getPosASL _towing;
    _posTow = _posTowTruck vectorAdd ((vectorDir _towing) vectorMultiply -5);

    if (_state == 1) then {
        _towing setHitpointDamage ["HitEngine", 1]; // TODO MP
        _dirV = (getPosASL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _angle = _dir - (getDir _vehicle);
        if(_angle > 180) then {_angle = _angle - 360;};
        if(_angle < -180) then {_angle = _angle + 360;};

        _vehicle setVariable [QGVAR(towStart), time];
        _vehicle setVariable [QGVAR(towState), 2];
        _vehicle setVariable [QGVAR(towAngle), _angle];
    };

    if (_state == 2) then {
        _dirV = (getPosASL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _start = _vehicle getVariable [QGVAR(towStart), time];
        _angle = _vehicle getVariable [QGVAR(towAngle), 45];

        _dt = time - _start;
        if ((_dt * 5) > abs(_angle)) then {
            _vehicle setDir _dir;
            _state = 3;
            _vehicle setVariable [QGVAR(towState), 3];
            _vehicle setVariable [QGVAR(towStart), time];
            _vehicle setVariable [QGVAR(towDistance), (getPosASL _vehicle) distance (_posTow)];
        } else {
            _vehicle setDir (_dir - _angle +  _dt * 5 * _angle / abs(_angle));
        };
    };

    if (_state == 3) then {
        _dirV = (getPosASL _vehicle) vectorFromTo _posTow;
        _start = _vehicle getVariable [QGVAR(towStart), time];
        _distance = _vehicle getVariable [QGVAR(towDistance), (getPosASL _vehicle) distance (_posTow)];

        _dt = time - _start;
        if (_dt > (_distance - 7)) then {
            _vehicle setVariable [QGVAR(towState), 4];
            _vehicle setVariable [QGVAR(lastPosVeh), getPosASL _vehicle];
            _towing setHitpointDamage ["HitEngine", 0];
        } else {
            _distance = -7 - (_distance - 7) + _dt;
            _posVeh = _posTow vectorAdd (_dirV vectorMultiply _distance);
            _vehicle setPosASL _posVeh;
        };
    };

    if (_state == 4) then {
        _lastPosVeh = _vehicle getVariable [QGVAR(lastPosVeh), getPosASL _vehicle];
        // Get direction vector
        _dirV = _lastPosVeh vectorFromTo _posTow;
        // Kill z-component
        _dirV set [2, 0];
        // Renormalize direction vector
        _dirV = _dirV vectorMultiply (1 / (vectorMagnitude _dirV));

        // Calculate new position for towed vehicle
        _posVeh = _posTow vectorAdd (_dirV vectorMultiply -7);
        // Get direction vector
        _dirV = _lastPosVeh vectorFromTo _posVeh;
        // Get compass direction for towed vehicle
        _dir = (_dirV select 0) atan2 (_dirV select 1);

        // Flip direction if tow truck is driving backwards
        _angle = (velocity _towing) vectorCos (vectorDir _towing);
        if (_angle < 0) then {
            _dir = _dir - 180;
        };
        // Ensure _dir is [0...360]
        if (_dir < 0) then {_dir = 360 + _dir};

        // Only calculate direction if vehicle moved more then 0.1m
        if ((_posVeh distance _lastPosVeh) > 0.1) then {
            _vehicle setDir _dir;
            _vehicle setVariable [QGVAR(dir), _dir];
            _vehicle setVariable [QGVAR(lastPosVeh), _posVeh];
        } else {
            _vehicle setDir (_vehicle getVariable QGVAR(dir));
        };
        // Prevent vehicle from sinking into terrain
        _atlZ = (ASLtoATL _posVeh) select 2;
        if (_atlZ < 0) then {
            _posVeh = _posVeh vectorDiff [0, 0, _atlZ];
            hint format ["z-fix %1\n%2", _atlZ, _posVeh];
        };

        _normal = [0,0,1];

        _collObj = [_vehicle, "GEOM"] intersect [_posVeh, _posVeh vectorDiff [0, 0, 1]];
        if (_atlZ < 0.4) then {
            {
                _normal = _normal vectorAdd (surfaceNormal (_posVeh vectorAdd _x));
            } foreach [[1,0,0], [0,1,0], [-1,0,0], [0,-1,0]];
        };
        _vehicle setVectorUp _normal;
        _vehicle setPosASL _posVeh;
    };
}, 0, [_towing, _towed]] call CBA_fnc_addPerFrameHandler;
