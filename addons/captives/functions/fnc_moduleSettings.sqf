#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Module for captivity settings
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_captives_fnc_moduleSettings
 *
 * Public: No
 */

params ["_logic"];

[_logic, QGVAR(allowHandcuffOwnSide), "allowHandcuffOwnSide"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowSurrender), "allowSurrender"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(requireSurrender), "requireSurrender"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(requireSurrenderAi), "requireSurrenderAi"] call EFUNC(common,readSettingFromModule);
