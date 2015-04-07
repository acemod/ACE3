/*
 * Author: commy2
 * Read properties of given vehicles light.
 *
 * Arguments:
 * 0: Object with lights (Object)
 * 1: Light classname (String)
 *
 * Return Value:
 * Stuff from config (Array)
 *
 */
#include "script_component.hpp"

private ["_vehicle", "_light"];

_vehicle = _this select 0;
_light = _this select 1;

private "_config";
_config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> _light;

// world position and direction
private ["_position", "_direction"];

_position = _vehicle modelToWorld (_vehicle selectionPosition getText (_config >> "position"));
_direction = _vehicle modelToWorld (_vehicle selectionPosition getText (_config >> "direction"));

_direction = _position vectorFromTo _direction;

// Intensity, angles
private ["_intensity", "_innerAngle", "_outerAngle"];

_intensity = getNumber (_config >> "intensity");
_innerAngle = getNumber (_config >> "innerAngle");
_outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]

/*
class Reflectors
{
    class Light_1
    {
        color[] = {1000,1000,1100};
        ambient[] = {10,10,11};
        intensity = 5;
        size = 1;
        innerAngle = 90;
        outerAngle = 130;
        coneFadeCoef = 2;
        position = "Light_1_pos";
        direction = "Light_1_dir";
        hitpoint = "Light_1_hitpoint";
        selection = "Light_1_hide";
        useFlare = 1;
        flareSize = 0.9;
        flareMaxDistance = 85;
        class Attenuation
        {
            start = 0;
            constant = 0;
            linear = 0;
            quadratic = 0.9;
            hardLimitStart = 40;
            hardLimitEnd = 60;
        };
    };
};
*/
