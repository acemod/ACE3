/*
 * Author: GitHawk
 * Module for adjusting the refuel settings.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example;
 * function = "ace_rearm_fnc_moduleRearmSettings"
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(level), "level"] call EFUNC(common,readSettingFromModule);

diag_log text format ["[ACE]: Rearm Module Initialized on level: %1", GVAR(level)];
