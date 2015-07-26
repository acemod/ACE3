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
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_logic);

if !(isServer) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(maxRange), "maxRange"] call EFUNC(common,readSettingFromModule);
