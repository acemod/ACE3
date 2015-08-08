/*
 * Author: commy2
 * Calculate light intensity object 1 recieves from object 2
 *
 * Arguments:
 * 0: Object that recieves light <OBJECT>
 * 1: Object that emits light <OBJECT>
 *
 * Return Value:
 * Brightest light level
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_unitPos","_lightLevel"];

params ["_unit", "_lightSource"];

_unitPos = _unit modelToWorld (_unit selectionPosition "spine3");
_lightLevel = 0;

if (_lightSource isKindOf "CAManBase") then {
    // handle persons with flashlights

    private "_weapon";
    _weapon = currentWeapon _lightSource;

    if !(_lightSource isFlashlightOn _weapon) exitWith {};

    private ["_flashlight", "_properties", "_intensity", "_innerAngle", "_outerAngle", "_position", "_direction", "_directionToUnit", "_distance", "_angle"];

    _flashlight = switch (_weapon) do {
        case (primaryWeapon _lightSource): {
            primaryWeaponItems _lightSource select 1
        };
        case (secondaryWeapon _lightSource): {
            secondaryWeaponItems _lightSource select 1
        };
        case (handgunWeapon _lightSource): {
            handgunItems _lightSource select 1
        };
        default {""};
    };

    _properties = [[_flashlight], FUNC(getLightPropertiesWeapon), uiNamespace, format [QEGVAR(cache,%1_%2), QUOTE(DFUNC(getLightPropertiesWeapon)), _flashlight], 1E11] call FUNC(cachedCall);
    //_properties = [_flashlight] call FUNC(getLightPropertiesWeapon);

    _innerAngle = (_properties select 3) / 2;
    _outerAngle = (_properties select 4) / 2;

    _position = _lightSource modelToWorld (_lightSource selectionPosition "rightHand");
    _direction = _lightSource weaponDirection _weapon;

    _directionToUnit = _position vectorFromTo _unitPos;

    _distance = _unitPos distance _position;
    _angle = acos (_direction vectorDotProduct _directionToUnit);

    _lightLevel = (linearConversion [0, 30, _distance, 1, 0, true]) * (linearConversion [_innerAngle, _outerAngle, _angle, 1, 0, true]);

} else {
    // handle any object, strcutures, cars, tanks, etc. @todo campfires, burning vehicles

    private "_lights";
    _lights = [_lightSource] call FUNC(getTurnedOnLights);

    {
        private ["_properties", "_intensity", "_innerAngle", "_outerAngle", "_position", "_direction", "_directionToUnit", "_distance", "_angle"];

        _properties = [[_lightSource, _x], FUNC(getLightProperties), uiNamespace, format [QEGVAR(cache,%1_%2_%3), QUOTE(DFUNC(getLightProperties)), typeOf _lightSource, _x], 1E11] call FUNC(cachedCall);
        //_properties = [_lightSource, _x] call FUNC(getLightProperties);

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

    // handle campfires
    if (inflamed _lightSource) then {
        private "_distance";
        _distance = _unitPos distance position _lightSource;

        _lightLevel = _lightLevel max linearConversion [0, 30, _distance, 0.5, 0, true];
    };

};

_lightLevel
