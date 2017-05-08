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

params [["_towTruck", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

_vehicle setVariable [QGVAR(towState), 1];

[{
    private ["_lastPosVeh", "_dirV", "_dir", "_angle", "_dt", "_posVeh"];
    params ["_args", "_pfID"];
    _args params [["_towTruck", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

    private _state = _vehicle getVariable QGVAR(towState);

    if (isNil "_state") exitWith {
        _vehicle setVariable [QGVAR(lastPosVeh), nil];
        _vehicle setVariable [QGVAR(towState), nil];
        _lastPosVeh = getPosASL _vehicle;
        _vehicle setPosASL [_lastPosVeh select 0, _lastPosVeh select 1, (_lastPosVeh select 2) + 0.1];
        _towTruck setHitpointDamage ["HitEngine", 0]; // TODO MP
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _posTowTruck = getPosASL _towTruck;
    (boundingBoxReal _towTruck) params ["_minTow"];
    _minTow params ["_minXTow", "_minYTow"];
    (boundingBoxReal _vehicle) params ["_min", "_max"];
    _min params ["_minX", "_minY", "_minZ"];
    _max params ["_maxX", "_maxY"];
    private _posTow = _posTowTruck vectorAdd ((vectorDir _towTruck) vectorMultiply _minYTow);

    if (_state == 1) then {
        // INIT
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
        // TURN
        _dirV = (getPosASL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _angle = _vehicle getVariable [QGVAR(towAngle), 45];

        _dt = time - (_vehicle getVariable [QGVAR(towStart), time]);
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

    private _towDistance = (_minXTow min _minX) min -4;

    if (_state == 3) then {
        // MOVE TOWARD TOWTRUCK
        _dirV = (getPosASL _vehicle) vectorFromTo _posTow;
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        _distance = _vehicle getVariable [QGVAR(towDistance), (getPosASL _vehicle) distance (_posTow)];

        _dt = time - (_vehicle getVariable [QGVAR(towStart), time]);
        if (_dt > (_distance + _towDistance)) then {
            _vehicle setVariable [QGVAR(towState), 4];
            _vehicle setVariable [QGVAR(lastPosVeh), getPosASL _vehicle];
        } else {
            _distance = _towDistance - (_distance + _towDistance) + _dt;
            _posVeh = _posTow vectorAdd (_dirV vectorMultiply _distance);
            _vehicle setDir _dir;
            _posVeh set [2, worldSize];
            _vehicle setPosASL _posVeh;
            _posVeh set [2, vectorMagnitude (_posVeh vectorDiff getPosVisual _vehicle)];
            _vehicle setPosASL _posVeh;
        };
    };

    if (_state == 4) then {
        // TOWING
        _lastPosVeh = _vehicle getVariable [QGVAR(lastPosVeh), getPosASL _vehicle];
        // Get direction vector
        _dirV = _lastPosVeh vectorFromTo _posTow;
        // Kill z-component
        _dirV set [2, 0];
        // Renormalize direction vector
        _dirV = vectorNormalized _dirV;

        // Calculate new position for towed vehicle
        _posVeh = _posTow vectorAdd (_dirV vectorMultiply _towDistance);
        // Get compass direction for towed vehicle
        _dir = (_dirV select 0) atan2 (_dirV select 1);
        // Ensure _dir is [0...360]
        if (_dir < 0) then {_dir = 360 + _dir};
        _vehicle setDir _dir;

        _posVeh set [2, worldSize];
        _vehicle setPosASL _posVeh;
        _posVeh set [2, vectorMagnitude (_posVeh vectorDiff getPosVisual _vehicle)];
        _vehicle setPosASL _posVeh;
        // Setting vehicle normal vector
        private _positions = [_vehicle modelToWorldVisual [_minX, _maxY, _minZ],
            _vehicle modelToWorldVisual [_maxX, _maxY, _minZ],
            _posVeh,
            _vehicle modelToWorldVisual [_minX, _minY, _minZ],
            _vehicle modelToWorldVisual [_maxX, _minY, _minZ]];
        private _collision = false;
        {
            if (lineIntersects [_x vectorAdd [0, 0, 3], _x vectorDiff [0, 0, 3], _vehicle, _towTruck]) exitWith {_collision = true;};
        } forEach _positions;
        // Calculate new normal vector
        private _normal = [0, 0, 0];
        if (!_collision) then {
            {
                _normal = _normal vectorAdd (surfaceNormal _x);
            } count _positions;
        } else {
            _normal = [0, 0, 1];
        };
        _vehicle setVectorUp _normal;
        _vehicle setPosASL _posVeh;

        // Only calculate direction if vehicle moved more then 0.1m
        if ((_posVeh distance _lastPosVeh) > 0.1) then {
            _vehicle setVariable [QGVAR(lastPosVeh), _posVeh];
        };
    };

}, 0, [_towTruck, _vehicle]] call CBA_fnc_addPerFrameHandler;
