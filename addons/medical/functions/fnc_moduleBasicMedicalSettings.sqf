#include "script_component.hpp"
/*
 * Author: Glowbal
 * Module for adjusting the medical treatment settings
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
 * [Logic, [bob, kevin], true] call ACE_medical_fnc_moduleBasicMedicalSettings
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(medicSetting_basicEpi), "medicSetting_basicEpi"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useLocation_basicEpi), "useLocation_basicEpi"] call EFUNC(common,readSettingFromModule);
