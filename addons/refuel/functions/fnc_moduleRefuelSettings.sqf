/*
 * Author: GitHawk
 * Module for adjusting the refuel settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(rate), "rate"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(civ_fuel), "civ_fuel"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(mil_fuel), "mil_fuel"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(stationary_fuel), "stationary_fuel"] call EFUNC(common,readSettingFromModule);
