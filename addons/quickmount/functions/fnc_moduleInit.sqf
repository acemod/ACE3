#include "script_component.hpp"
/*
 * Author: Kingsley
 * Initializes the quick-mount module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY> (Unused)
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(distance), "distance"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(speed), "speed"] call EFUNC(common,readSettingFromModule);
