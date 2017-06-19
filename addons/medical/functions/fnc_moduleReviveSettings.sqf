/*
 * Author: Glowbal
 * Module for adjusting the medical revive settings
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
 * [LOGIC, [bob, kevin], true] call ACE_medical_fnc_moduleReviveSettings
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(maxReviveTime), "maxReviveTime"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(amountOfReviveLives), "amountOfReviveLives"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enableRevive), "enableRevive"] call EFUNC(common,readSettingFromModule);
