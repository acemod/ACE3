#include "script_component.hpp"
/*
 * Author: Jonpas
 * Initializes the Headless module.
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

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QXGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QXGVAR(delay), "delay"] call EFUNC(common,readSettingFromModule);
[_logic, QXGVAR(endMission), "endMission"] call EFUNC(common,readSettingFromModule);
[_logic, QXGVAR(log), "log"] call EFUNC(common,readSettingFromModule);

INFO("Headless Module Initialized.");
