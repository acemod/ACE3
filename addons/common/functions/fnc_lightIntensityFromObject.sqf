/*
 * Author: commy2
 * Calculate light intensity object 1 recieves from object 2
 *
 * Arguments:
 * 0: Object that recieves light (Object)
 * 1: Object that emits light (Object)
 *
 * Return Value:
 * Brightest light level
 *
 */
#include "script_component.hpp"

private ["_unit", "_lightSource"];

_unit = _this select 0;
_lightSource = _this select 1;

private "_unitPos";
_unitPos = _unit modelToWorld (_unit selectionPosition "spine3");

private ["_lights", "_lightLevel"];

_lights = [_lightSource] call FUNC(getTurnedOnLights);

_lightLevel = 0;

{
    private ["_properties", "_intensity", "_innerAngle", "_outerAngle", "_position", "_direction", "_directionToUnit", "_distance", "_angle"];

    _properties = [_lightSource, _x] call FUNC(getLightProperties);

    // @todo intensity affects range?
    //_intensity = _properties select 0;

    _innerAngle = (_properties select 3) / 2;
    _outerAngle = (_properties select 4) / 2;

    // get world position and direction
    _position = _lightSource modelToWorld (_lightSource selectionPosition (_properties select 1));
    _direction = _lightSource modelToWorld (_lightSource selectionPosition (_properties select 2));

    _direction = _position vectorFromTo _direction;
    _directionToUnit = _position vectorFromTo _unitPos;

    _distance = _unitPos distance _position;
    _angle = acos (_direction vectorDotProduct _directionToUnit);

    _lightLevel = _lightLevel max ((linearConversion [0, 30, _distance, 1, 0, true]) * (linearConversion [_innerAngle, _outerAngle, _angle, 1, 0, true]));

//systemChat  format ["%1 %2", (linearConversion [0, 30, _distance, 1, 0, true]), (linearConversion [_innerAngle, _outerAngle, _angle, 1, 0, true])];

} forEach _lights;

_lightLevel
