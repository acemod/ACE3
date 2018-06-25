#include "script_component.hpp"
/*
 * Author: commy2
 * Obtain children of a config entry
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Parent Entry Class Children <ARRAY>

 * Example:
 * [bob] call ace_common_fnc_getChildren
 *
 * Public: Yes
 */

params ["_name", "_cfgClass"];

private _classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _cfgClass);

_classes apply {configName _x} // return
