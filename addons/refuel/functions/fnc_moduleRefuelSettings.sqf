#include "script_component.hpp"
/*
 * Author: GitHawk
 * Module for adjusting the refuel settings.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_refuel_fnc_moduleRefuelSettings
 *
 * Public: No
 */

params ["_logic", "", ["_activated", false, [false]]];

if !(_activated) exitWith {};

[_logic, QGVAR(rate), "rate"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(hoseLength), "hoseLength"] call EFUNC(common,readSettingFromModule);

INFO_2("Refuel Module Initialized with flow rate: %1 - hoseLength: %2",GVAR(rate), GVAR(hoseLength))
