/*
 * Author: Glowbal
 * Module for adjusting the medical damage settings
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

private ["_logic", "_units", "_activated"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(level), "level"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableFor), "enableFor"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableAirway), "enableAirway"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableFractures), "enableFractures"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableAdvancedWounds), "enableAdvancedWounds"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableScreams), "enableScreams"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(playerDamageThreshold), "playerDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(AIDamageThreshold), "AIDamageThreshold"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableUnsconsiousnessAI), "enableUnsconsiousnessAI"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(preventInstaDeath), "preventInstaDeath"] call EFUNC(common,readSettingFromModule);
