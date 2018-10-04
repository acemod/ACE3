#include "script_component.hpp"
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
 * Example:
 * [car, "light"] call ace_common_fnc_getLightProperties
 *
 * Public: Yes
 */

params ["_vehicle", "_light"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Reflectors" >> _light;

private _intensity = getNumber (_config >> "intensity");
private _position = getText (_config >> "position");
private _direction = getText (_config >> "direction");
private _innerAngle = getNumber (_config >> "innerAngle");
private _outerAngle = getNumber (_config >> "outerAngle");

[_intensity, _position, _direction, _innerAngle, _outerAngle]
