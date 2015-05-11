/*
 * Author: SilentSpike
 * Module for adjusting various aspects of zeus
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

[_logic, QGVAR(settingAscension), "zeusAscension"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(settingBird), "zeusBird"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(settingOrdnance), "radioOrdnance"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(settingMines), "revealMines"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(settingWind), "remoteWind"] call EFUNC(common,readSettingFromModule);