#include "script_component.hpp"
/*
 * Author: GitHawk
 * Module for adjusting the rearm settings.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * function = "ace_rearm_fnc_moduleRearmSettings"
 *
 * Public: No
 */

params [
    "_logic",
    "",
    ["_activated", false, [false]]
];

if (!_activated) exitWith {};

[_logic, QGVAR(level), "level"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(supply), "supply"] call EFUNC(common,readSettingFromModule);

INFO_2("Module Initialized [level: %1][supply: %2]",GVAR(level),GVAR(supply));
