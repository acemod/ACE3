/*
 * Author: commy2
 * Read properties of given flashlight. @todo, Can weapons themselves still have flashlights (no attachment)?
 *
 * Arguments:
 * 0: A flashlight (String)
 *
 * Return Value:
 * Stuff from config (Array)
 *
 */
#include "script_component.hpp"

params ["_weapon"];

private ["config", "_intensity", "_position", "_direction", "_innerAngle", "_outerAngle"];
_config = configFile >> "CfgWeapons" >> _weapon >> "ItemInfo" >> "FlashLight";

_intensity = getNumber (_config >> "intensity");
_position = getText (_config >> "position");
_direction = getText (_config >> "direction");
_innerAngle = getNumber (_config >> "innerAngle");
_outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]

/*
class FlashLight
{
    color[] = {180,156,120};
    ambient[] = {0.9,0.78,0.6};
    intensity = 20;
    size = 1;
    innerAngle = 20;
    outerAngle = 80;
    coneFadeCoef = 5;
    position = "flash dir";
    direction = "flash";
    useFlare = 1;
    flareSize = 1.4;
    flareMaxDistance = "100.0f";
    dayLight = 0;
    class Attenuation
    {
        start = 0.5;
        constant = 0;
        linear = 0;
        quadratic = 1.1;
        hardLimitStart = 20;
        hardLimitEnd = 30;
    };
    scale[] = {0};
};
*/
