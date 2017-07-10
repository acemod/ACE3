/*
 * Author: bux578
 * Initializes the SwitchUnits module
 *
 * Arguments:
 * 0: module logic <OBJECT>
 * 1: list of affected units <ARRAY<OBJECT>>
 * 2: isActivated <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(SwitchToWest), "SwitchToWest"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(SwitchToEast), "SwitchToEast"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(SwitchToIndependent), "SwitchToIndependent"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(SwitchToCivilian), "SwitchToCivilian"] call EFUNC(common,readSettingFromModule);

[_logic, QGVAR(EnableSafeZone), "EnableSafeZone"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(SafeZoneRadius), "SafeZoneRadius"] call EFUNC(common,readSettingFromModule);

[QGVAR(EnableSwitchUnits), true, false, true] call EFUNC(common,setSetting);

INFO("SwitchUnits Module Initialized.");
