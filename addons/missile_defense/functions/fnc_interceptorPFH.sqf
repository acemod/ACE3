#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Processes each interceptor
 *
 * Arguments:
 * 0: Args <ARRAY>
 * 1: Handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_missile_defense_interceptorPFH] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

{
    private _interceptors = _y getOrDefault ["interceptors", []];
    {
        _x params ["_projectile", "_target", "_lastPosition", "_lastDistance"];
        if (isNull _projectile) then {
            _interceptors deleteAt _forEachIndex;
            if !(isNull _target) then {
                (_system getOrDefault ["targets_tracking", []]) pushBack _target;
                TRACE_2("Interceptor no longer exists",_projectile,_target);
            };
            continue;
        };
        if (isNull _target) then {
            // TODO pick a different target?
            _interceptors deleteAt _forEachIndex;
            continue;
        };
        private _currentPosition = getPosASLVisual _projectile;
        private _targetPosition = getPosASLVisual _target;

        private _posDiff = (_currentPosition vectorDiff _lastPosition);
        private _lengthSqr = _posDiff vectorDotProduct _posDiff;
        private _minDistance = if (_lengthSqr - 0.001 <= 0) then {
            _lastPosition vectorDistance _targetPosition
        } else {
            private _d = (_targetPosition vectorDiff _lastPosition) vectorDotProduct (_currentPosition vectorDiff _lastPosition);
            private _t = 0 max (1 min (_d / _lengthSqr));
            private _projection = _lastPosition vectorAdd ((_currentPosition vectorDiff _lastPosition) vectorMultiply _t);
            _projection vectorDistance _targetPosition;
        };

        _x set [2, _currentPosition];
        _x set [3, _minDistance];

        if (_minDistance <= GVAR(proximityFuseRange) || { _minDistance > _lastDistance }) then {
            triggerAmmo _projectile;
            _interceptors deleteAt _forEachIndex;
            // if we overshot target, dont take out target
            if (_minDistance <= _lastDistance && { GVAR(proximityFuseFailureChance) <= random 1 }) then {
                private _explosion = createVehicle ["SmallSecondary", _target, [], 0, "CAN_COLLIDE"];
                [QGVAR(destroyProjectile), [_target]] call CBA_fnc_globalEvent;
            } else {
                (_system getOrDefault ["targets_tracking", []]) pushBack _target;
                TRACE_2("Interceptor failed to intercept target",_projectile,_target);
            };
        };
    } forEachReversed _interceptors;
} forEach GVAR(systems);
