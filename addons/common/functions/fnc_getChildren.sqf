#include "..\script_component.hpp"
/*
 * Author: commy2
 * Obtain children of a config entry
 *
 * Arguments:
 * 0: Parent class name <STRING>
 * 1: Root config class name (e.g. "CfgVehicles") <STRING>
 *
 * Return Value:
 * Names of direct child classes <ARRAY of STRINGs>
 *
 * Example:
 * ["Car", "CfgVehicles"] call ace_common_fnc_getChildren
 *
 * Public: Yes
 */

params ["_name", "_cfgClass"];

private _classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _cfgClass);

_classes apply {configName _x} // return
