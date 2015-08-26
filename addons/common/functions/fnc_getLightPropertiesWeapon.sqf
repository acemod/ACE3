/*
 * Author: commy2
 * Read properties of given flashlight.
 *
 * Arguments:
 * 0: Flashlight <STRING>
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

// Todo: Can weapons themselves still have flashlights (no attachment)?

private ["_config", "_intensity", "_position", "_direction", "_innerAngle", "_outerAngle"];

params ["_weapon"];

_config = configFile >> "CfgWeapons" >> _weapon >> "ItemInfo" >> "FlashLight";

_intensity = getNumber (_config >> "intensity");
_position = getText (_config >> "position");
_direction = getText (_config >> "direction");
_innerAngle = getNumber (_config >> "innerAngle");
_outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]
