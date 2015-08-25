/*
 * Author: commy2
 * Read properties of given vehicles light.
 *
 * Arguments:
 * 0: Object with lights <OBJECT>
 * 1: Light classname <STRING>
 *
 * Return Value:
 * 0: Light intensity <NUMBER>
 * 1: Light position <STRING>
 * 2: Light direction <STRING>
 * 3: Light inner angle <NUMBER>
 * 4: Light outer angle <NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle", "_light"];

private ["_config", "_intensity", "_position", "_direction", "_innerAngle", "_outerAngle"];
_config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> _light;

_intensity = getNumber (_config >> "intensity");
_position = getText (_config >> "position");
_direction = getText (_config >> "direction");
_innerAngle = getNumber (_config >> "innerAngle");
_outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]
