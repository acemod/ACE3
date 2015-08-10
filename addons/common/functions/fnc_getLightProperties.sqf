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

PARAMS_2(_vehicle,_light);

private "_config";
_config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> _light;

private ["_intensity", "_position", "_direction", "_innerAngle", "_outerAngle"];

_intensity = getNumber (_config >> "intensity");
_position = getText (_config >> "position");
_direction = getText (_config >> "direction");
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
