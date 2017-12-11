/*
 * Author: Glowbal
 * Module for adjusting the cargo settings
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
 * function = "ace_cargo_fnc_loadItem"
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enable), "enable"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(paradropTimeCoefficent), "paradropTimeCoefficent"] call EFUNC(common,readSettingFromModule);

INFO("Cargo Module Initialized.");
