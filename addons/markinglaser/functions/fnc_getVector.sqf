#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Calculates the directional vector of the marking laser.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Laser <OBJECT>
 *
 * Return Value:
 * Directional vector of laser in world space <ARRAY>
 *
 * Example:
 * [plane, laser] call ace_markinglaser_fnc_getVector
 *
 * Public: No
 */
params ["_aircraft", "_laser"];

#ifndef DEBUG_MODE_FULL
if (local _aircraft) exitWith {
    _aircraft vectorModelToWorldVisual getPilotCameraDirection _aircraft
};
#endif

// _type      - Target type
// _target    - Locked target, either an object, a position or a vector
// _time      - When this info was last synched
// _isNewInfo - NIL when this info was just updated, otherwise true (not synched)
private _laserInfo = _laser getVariable [QGVAR(laserInfo), []];
_laserInfo params ["_type", "_target", "_time", ["_isNewInfo", true]];

private _originModel = _aircraft getVariable [QGVAR(laserOrigin), [0, 0, 0]];
private _origin = _aircraft modelToWorldVisualWorld _originModel;
private _deltaTime = CBA_missionTime - _time;

// If an update is older than 2s, the laser movement is stopped
// This would indicate a lot of lag and cause the laser to go off into nowhere
if (_deltaTime > UPDATE_INTERVAL * 2) exitWith {
    _aircraft vectorModelToWorld vectorUp _laser;
};

private _interpolationInfo = _laser getVariable [QGVAR(interpolationInfo), []];
_interpolationInfo params ["_lastTarget", "_cachedTarget", ["_cachedType", ""]];

// If laser info was just synched, use previous position/vector for interpolation start
if (_isNewInfo) then {
    // TYPE_VECTOR doesn't clip interpolation, use current orientation instead
    _cachedTarget = [_cachedTarget, _aircraft vectorWorldToModelVisual vectorUp _laser] select (_type == TYPE_VECTOR);

    // Do not interpolate if type changed - might cause a snap when locking but should be OK
    _lastTarget = [_target, _cachedTarget] select (_type == _cachedType);

    // Update info arrays
    _laser setVariable [QGVAR(interpolationInfo), [_lastTarget, _target, _type]];
    _laserInfo set [3, false];
};

private _vector = [0, 0, 0];
switch (_type) do {
    case TYPE_OBJECT: {
        // Don't interpolate because laser should always directly point at object
        _vector = _origin vectorFromTo getPosASLVisual _target;
    };
    case TYPE_GROUND: {
        // Interpolate between last position and current position
        private _interpolatedPos = vectorLinearConversion [0, UPDATE_INTERVAL, _deltaTime, _lastTarget, _target, true];
        _vector = _origin vectorFromTo _interpolatedPos;
    };
    case TYPE_VECTOR: {
        // Interpolate between last vector and current vector
        // Interpolation is deliberately not clipped to smoothen movement with delayed updates
        private _interpolatedVec = vectorLinearConversion [0, UPDATE_INTERVAL, _deltaTime, _lastTarget, _target, false];
        _vector = _aircraft vectorModelToWorldVisual _interpolatedVec;
    };
};

_vector
