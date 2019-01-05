#include "script_component.hpp"
/*
 * Author: Glowbal
 * Module for adjusting the medical menu settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ACE_medical_menu_fnc_module
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(allow), "allow"] call EFUNC(common,readSettingFromModule);
