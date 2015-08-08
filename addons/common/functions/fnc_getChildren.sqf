/*
 * Author: commy2
 *
 * Get Chidrens from a config entry
 *
 * Arguments:
 * 0: Unit (OBJECT)
 *
 * Return value:
 * Childs form Parent Entry(CONFIG)
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_classes"];

params ["_name", "_cfgClass"];

_classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _cfgClass);
_classes = [_classes, {configName _this}] call FUNC(map);
_classes
