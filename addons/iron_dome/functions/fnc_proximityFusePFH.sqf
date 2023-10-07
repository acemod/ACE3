#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles the fusing and detonation of any and all interceptors in the air
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_iron_dome_proximityFusePFH] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */

GVAR(interceptors) = GVAR(interceptors) select {
    _x params ["_projectile", "_target", "_lastPosition", "_lastDistance"];
    // Sweep along path to ensure we don't overshoot target
    private _minDistance = 0;

    private _currentPosition = getPosASLVisual _projectile;
    private _targetPosition = getPosASLVisual _target;

    private _posDiff = (_currentPosition vectorDiff _lastPosition);
    private _lengthSqr = _posDiff vectorDotProduct _posDiff;
    if (_lengthSqr - 0.001 <= 0) then {
        _minDistance = _lastPosition vectorDistance _targetPosition
    } else {
        private _d = (_targetPosition vectorDiff _lastPosition) vectorDotProduct (_currentPosition vectorDiff _lastPosition);
        private _t = 0 max (1 min (_d / _lengthSqr));
        private _projection = _lastPosition vectorAdd ((_currentPosition vectorDiff _lastPosition) vectorMultiply _t);
        _minDistance = _projection vectorDistance _targetPosition;
    };

    _x set [2, _currentPosition];
    _x set [3, _minDistance];

    #ifdef DRAW_TRACKING_INFO
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,0,1,1], (getPos _target) vectorAdd [0, 0, 0.5], 0.75, 0.75, 0, format ["%1m", _minDistance], 1, 0.025, "TahomaB"];
    #endif
    if (!alive _target || { _minDistance <= GVAR(proximityFuseRange) } || { _minDistance > _lastDistance }) then {
        triggerAmmo _projectile;
        // if we overshot target, dont take out target
        if (_minDistance <= _lastDistance && { GVAR(proximityFuseFailureChance) <= random 1 }) then {
            private _explosion = createVehicle ["SmallSecondary", _target, [], 0, "CAN_COLLIDE"];
            [QGVAR(destroyProjectile), [_target]] call CBA_fnc_globalEvent;
        };
        false
    } else {
        true
    }
};
