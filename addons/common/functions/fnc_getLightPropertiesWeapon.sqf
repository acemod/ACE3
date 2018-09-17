#include "script_component.hpp"
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
 * Example:
 * ["flashlight"] call ace_common_fnc_getLightPropertiesWeapon
 *
 * Public: Yes
 */

params ["_weapon"];

private _config = configFile >> "CfgWeapons" >> _weapon >> "ItemInfo" >> "FlashLight";

private _intensity = getNumber (_config >> "intensity");
private _position = getText (_config >> "position");
private _direction = getText (_config >> "direction");
private _innerAngle = getNumber (_config >> "innerAngle");
private _outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]
