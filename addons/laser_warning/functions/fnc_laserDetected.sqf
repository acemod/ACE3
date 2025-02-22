#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns whether or not the object detects a laser hitting it
 *
 * Arguments:
 * 0: Source Position (ASL) <ARRAY>
 * 1: Source Direction <ARRAY>
 * 2: Object with LWS <OBJECT>
 *
 * Return Value:
 * Whether or not laser has hit object <BOOL>
 *
 * Example:
 * [getPosASL player, [0.707, 0, 0.707], MyCar] call ace_laser_warning_fnc_laserDetected;
 *
 * Public: No
 */
params ["_laserSource", "_laserDirection", "_object"];
TRACE_3("laser intersect?",_laserSource,_laserDirection,_object);

(_object getVariable [QGVAR(detectionParameters), [[0, 0, 0], 0]]) params ["_offset", "_radius"];
private _position = (getPosASLVisual _object) vectorAdd _offset;

// Sphere-Ray intersection from https://iquilezles.org/articles/intersectors/
private _direction = _laserSource vectorDiff _position;
private _b = _direction vectorDotProduct _laserDirection;
private _c = (_direction vectorDotProduct _direction) - (_radius * _radius);
private _h = (_b * _b) - _c;
TRACE_1("laser intersect?",_h);
if (_h >= 0.0) then {
    _h = sqrt _h;
    private _intersectDist0 = -_b - _h;
    private _intersectDist1 = -_b + _h;
    private _intersectPos = if (_intersectDist0 < 0) then {
        _laserSource vectorAdd (_laserDirection vectorMultiply _intersectDist1)
    } else {
        _laserSource vectorAdd (_laserDirection vectorMultiply _intersectDist0)
    };
    !terrainIntersectASL [_laserSource, _intersectPos]
} else {
    false
}

