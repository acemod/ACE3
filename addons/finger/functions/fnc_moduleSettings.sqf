#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Module for fingering settings
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic] call ace_finger_fnc_moduleSettings
 *
 * Public: No
 */

params ["_logic"];

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(maxRange), "maxRange"] call EFUNC(common,readSettingFromModule);
