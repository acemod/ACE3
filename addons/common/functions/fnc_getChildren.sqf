/*
 * Author: commy2
 * Obtain children of a config entry
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Parent Entry Class Children <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_name", "_CfgClass"];

private "_classes";
_classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _CfgClass);

[_classes, {configName _this}] call FUNC(map) // return
